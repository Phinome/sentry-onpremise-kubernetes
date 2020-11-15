#------------------------------
# VIA MICROK8S (Mac)
#------------------------------
microk8s install --mem 4 --cpu 2 --disk 15
microk8s disable ha-cluster
microk8s enable dns storage

#Writes the Kubernetes cluster IP on /etc/hosts
sudo echo "$(multipass info microk8s-vm | grep IPv4 | awk '{ print $2 }')"' k8s.cluster' | sudo tee -a /etc/hosts

#------------------------------
# VIA MICROK8S (Ubuntu Server)
#------------------------------
sudo snap install microk8s --classic

#sudo usermod -a -G microk8s ubuntu
#sudo chown -f -R ubuntu ~/.kube

microk8s disable ha-cluster
microk8s enable dns storage ingress metrics-server
alias kubectl="microk8s kubectl"

#------------------------------
# VIA MINIKUBE
#------------------------------
minikube start --memory 4096 --cpus 2 --vm-driver=hyperkit
minikube addons enable ingress

#Writes the Kubernetes minikube cluster IP on /etc/hosts
sudo echo "$(minikube ip)"' k8s.cluster' | sudo tee -a /etc/hosts

#------------------------------
# COMMON
#------------------------------
#Cert-Manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.yaml
