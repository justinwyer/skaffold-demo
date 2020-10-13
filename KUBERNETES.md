# Local Dev with Skaffold

Skaffold needs a Kubenetes cluster in order to deploy your services. Below are some local Kubernetes options. I recommend [MiniKube](#install-minikube). You ***ONLY*** need one kind of Kubernetes setup. If you have both Docker Desktop & Minikube, you can disable one of them to save RAM while you work.

## Install MiniKube
*This works on Mac, Windows & Linux*

Install [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

Start a [minikube cluster](https://kubernetes.io/docs/setup/learning-environment/minikube/#specifying-the-vm-driver) with your prefered hypervisor (HyperV on Windows, VMWare or VirtualBox on Mac):
```
$ minikube start --driver=vmware --memory=4g --cpus=2 --disk-size=20g
```

Enable the ingress for your minikube:
```
$ minikube addons enable ingress
```

Check that your cluster is up:

```
$ kubectl get -n kube-system po
NAME                                        READY   STATUS    RESTARTS   AGE
coredns-6955765f44-9zgz2                    1/1     Running   3          15h
coredns-6955765f44-kmzsv                    1/1     Running   3          15h
etcd-m01                                    1/1     Running   3          15h
kube-apiserver-m01                          1/1     Running   71         15h
kube-controller-manager-m01                 1/1     Running   9          15h
kube-proxy-ltszs                            1/1     Running   3          15h
kube-scheduler-m01                          1/1     Running   39         15h
nginx-ingress-controller-6fc5bcc8c9-nzg4h   1/1     Running   96         15h
storage-provisioner                         1/1     Running   2          15h
```

## Install Docker Desktop
*This works on Mac & Windows*

### Install Docker Desktop

### Windows

#### Install

https://docs.docker.com/docker-for-windows/install/

#### Enable Kubernetes

https://docs.docker.com/docker-for-windows/#kubernetes#kubernetes

### Mac

#### Install

https://docs.docker.com/docker-for-mac/install/

#### Enable Kubernetes

https://docs.docker.com/docker-for-mac/#kubernetes

### Install ingress in docker desktop

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml
```

## Test that your cluster is working:

Install a test app:

```
$ kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml
```

Wait for the app to be ready:

```
$ kubectl get po
NAME      READY   STATUS    RESTARTS   AGE
bar-app   1/1     Running   0          12s
foo-app   1/1     Running   0          12s
```

Check that it works:

```
$ minikube ip
192.168.54.13
$ curl http://`minikube ip`/foo
foo
```

Clean up the test

```
$ kubectl delete -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml
```

## Install skaffold

Instructions are [here](https://skaffold.dev/docs/install/)

## Bring up the demo enviroment

```
$ skaffold dev -f demo.yaml
```