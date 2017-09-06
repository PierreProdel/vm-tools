#!/bin/bash

clear
echo "- Installing Kubernetes"

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# kubectl from https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-via-curl
echo "Installing kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Install VirtualBox
wget -q -O - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update
sudo apt-get install virtualbox-5.1

# minikube from https://github.com/kubernetes/minikube/releases
echo "Installing minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

# All done
echo ---------------------------------------------------------------------------
echo `kubectl version` is installed
echo `minikube version` is installed
echo You can now start you local cluster with 'minikube start'
echo -e "\033[31mHowever, this cluster is very CPU intensive."
echo -e "Reserve it for k8s tests. Use Docker for DEV needs instead.\033[0m"
echo ---------------------------------------------------------------------------