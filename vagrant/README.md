# Vagrant Up

Then once it is complete skip to [Skaffold](#skaffold)

## Install Vagrant

### Disable HyperV *(optional for Windows users only)*

Other hypervisors cannot run side by side with other Hypervisors, so if you want to use virtual box please [ensure it is disabled](https://support.microsoft.com/en-za/help/3204980/virtualization-applications-do-not-work-together-with-hyper-v-device-g). This will disable Docker for Windows if you have it installed.

### Install Virtual Box

https://www.virtualbox.org/wiki/Downloads

### Enable VX-T/VX-D CPU Extension

You will need to find these settings in your BIOS

### Install Vagrant

https://www.vagrantup.com/downloads.html

### Vagrant Up!

```
$ vagrant up skaffold
  ... this will take a while the first time!
```

The above command will take around 10 - 15 minutes to run, depending on your internet connection. Once it is complete you can SSH into your new VM:

```
$ vagrant ssh skaffold
```

### Check Kubernetes
```
➜  ~ sudo -s
➜  ~ kubectl get -n kube-system po
NAME                                      READY   STATUS      RESTARTS   AGE
helm-install-traefik-x7cxd                0/1     Completed   0          7h28m
metrics-server-6d684c7b5-9zvjk            1/1     Running     1          7h28m
svclb-traefik-k5m72                       2/2     Running     2          7h27m
local-path-provisioner-58fb86bdfd-p674x   1/1     Running     1          7h28m
coredns-d798c9dd-dpqzz                    1/1     Running     1          7h28m
traefik-6787cddb4b-rvfdd                  1/1     Running     1          7h27m
```

## Skaffold

You can now run skaffold for the first time *it may take a few minutes*:
```
Delete wrapper folder, if present, inside .m2 directory
$ vagrant ssh
➜  ~ cd src
➜  ~ skaffold dev -f demo.yaml --trigger='polling'
```