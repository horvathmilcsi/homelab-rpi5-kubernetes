# homelab-rpi5-kubernetes
My kubernetes homelab for my Raspberry pi 5

## Purpose  
1) Install Ansible on Rpi5
2) Install K3S Kubernetes Rpi5 (via Ansible)

## Prerequisites  
1) have a linux OS on your Raspberry Pi 5 (I tested with Raspberry Pi OS, that is a Debian GNU/Linux 12 bookworm under the hood)

## How to use
1) ssh into your rpi5
2) run this script:
```bash
sudo apt update  ### If at some point you will be asked to decide between Yes/No/xyz, choose Yes :)
sudo apt -y install git
mkdir ~/repos/   ###  Create a new parent folder for this git repo
cd ~/repos/
git clone https://github.com/horvathmilcsi/homelab-rpi5-kubernetes.git
cd homelab-rpi5-kubernetes/
./1_bootstrap_linux/2_install_ansible.sh   ### this will install Ansible
cd ansible/
./9_start_ansible_bootstrap.sh   ### this will install k3s and all its dependencies and configs via Ansible
```
3) if no errors shown, restart your rpi5 via the next command. If errors, then fix the errors first
```bash
sudo reboot
```
5) after reboot, ssh into your rpi5
6) execute this command:
```bash
kubectl get nodes   ### this should give an output and no errors
```
example output:
```bash
kubectl get nodes
NAME            STATUS   ROLES                  AGE   VERSION
raspberrypi-0   Ready    control-plane,master   17s   v1.33.4+k3s1
```
7) Enjoy your brand new Kubernetes 'cluster' :)



