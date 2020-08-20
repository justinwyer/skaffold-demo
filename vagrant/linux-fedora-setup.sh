#!/bin/bash
if [ -z $1 ]
then
    RUN_BY=`who | awk '{print $1}'`
else
    RUN_BY=$1
fi
RUN_BY_HOME=`/bin/bash -c "echo ~$RUN_BY"`
echo "Run by $RUN_BY with home $RUN_BY_HOME"

# Install utilities
dnf -y install snapd util-linux-user git grubby
service snapd start

# Install Java
cat <<'EOF' > /etc/yum.repos.d/adoptopenjdk.repo
[AdoptOpenJDK]
name=AdoptOpenJDK
baseurl=http://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/fedora/$releasever/$basearch
enabled=1
gpgcheck=1
gpgkey=https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public
EOF
dnf -y install adoptopenjdk-11-hotspot

# Install Ngrok
snap install ngrok

# Install Docker
dnf -y install dnf-plugins-core
dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
dnf -y install docker-ce docker-ce-cli containerd.io
usermod -G docker $RUN_BY
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
systemctl enable docker

# Install k3s
curl -sfL https://get.k3s.io | sh -s - --docker --write-kubeconfig-mode 644
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> /etc/profile
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> $RUN_BY_HOME/.profile
echo 'Defaults env_keep += "KUBECONFIG"' > /etc/sudoers.d/100_kubeconfig
chmod 666 /etc/rancher/k3s/k3s.yaml

source /etc/profile
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml

# Install Skaffold
curl -Lo /usr/local/bin/skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x /usr/local/bin/skaffold

# Install ZSH
dnf -y install zsh
chsh -s $(which zsh) $RUN_BY
ZSH="$RUN_BY_HOME/.oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp $RUN_BY_HOME/.oh-my-zsh/templates/zshrc.zsh-template $RUN_BY_HOME/.zshrc
echo "source $RUN_BY_HOME/.profile" >> $RUN_BY_HOME/.zshrc