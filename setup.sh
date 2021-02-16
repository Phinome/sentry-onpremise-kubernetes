#------------------------------
# VIA MICROK8S (Ubuntu Server)
#------------------------------
sudo snap install microk8s --classic

#sudo usermod -a -G microk8s ubuntu
#sudo chown -f -R ubuntu ~/.kube

microk8s disable ha-cluster
microk8s enable dns storage ingress metrics-server
alias kubectl="microk8s kubectl"

#Cert-Manager
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.1.0/cert-manager.yaml
