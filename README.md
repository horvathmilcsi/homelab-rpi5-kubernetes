# homelab-rpi5-kubernetes
My kubernetes homelab for my Raspberry Pi 5

## Purpose  
### Level 1:
1) Install Ansible on Rpi5 (with dependencies)
2) Install K3S Kubernetes Rpi5 (via Ansible, with dependencies)

### Level 2:
3) Install Helm - a package manager (via Ansible, with dependenices)
4) Install k9s - a Kubernetes TUI management tool (via Ansible)
5) Install Portainer - a Kubernetes management tool (via Ansible)

## Prerequisites  
1) have an installed linux OS on your Raspberry Pi 5, with SSH access enabled
(I tested with Raspberry Pi OS, that is a Debian GNU/Linux 12 bookworm under the hood)

## How to use
### Level 1 (Install Ansible + K3S)
1) ssh into your PPi 5
2) run this script (you can run it multiple times, since it is idempotent):
```bash
sudo apt update  ### If at some point you will be asked to decide between Yes/No/xyz, choose Yes :)
sudo apt -y install git
mkdir ~/repos/   ###  Create a new parent folder for this git repo
cd ~/repos/
git clone https://github.com/horvathmilcsi/homelab-rpi5-kubernetes.git
cd homelab-rpi5-kubernetes/
./1_bootstrap_linux/2_install_ansible.sh   ### this will install Ansible
cd ansible/
./9_start_ansible_bootstrap.sh   ### this will perform a config on /boot/firmware/cmdline.txt and then reboot your RPi 5
```
3) your RPi 5 will be rebooted (because of .txt changed) 
4) after reboot, ssh into your RPi 5
5) run this script (you can run it multiple times, since it is idempotent):
```bash
cd ~/repos/homelab-rpi5-kubernetes/ansible/
./9_start_ansible_bootstrap.sh   ### this will install k3s and all its dependencies and configs via Ansible
```
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

### Level 2 (Install Helm, k9s, Portainer)
1) ssh into your RPi 5
2) run this script (you can run it multiple times, since it is idempotent):
```bash
cd ~/repos/homelab-rpi5-kubernetes/ansible/
./2_k9s_helm_portainer_bootstrap.sh   ### this will install k9s and helm and portainer via Ansible
```
3) execute this command:
```bash
k9s   ### this should start the k9s TUI and connect to your cluster
```
4) in a web broswer on your local network, open the website: http://<ip_of_your_raspberry_pi>:9000
.### this should open Portainer homepage

## Repo structure
```bash
:~/repos/homelab-rpi5-kubernetes $ tree  
.  
├── 1_bootstrap_linux  
│   ├── 1_start_wsl_ubuntu.bat  
│   └── 2_install_ansible.sh  
├── ansible  
│   ├── 9_start_ansible_bootstrap.sh  
│   ├── ansible.cfg  
│   ├── inventory  
│   │   └── hosts.ini  
│   ├── playbooks  
│   │   └── bootstrap.yml  
│   └── roles  
│       ├── common  
│       │   └── tasks  
│       │       └── main.yml  
│       ├── k3s  
│       │   └── tasks  
│       │       └── main.yml  
│       └── set_replace_key_value  
│           └── tasks  
│               └── main.yml  
└── README.md  
```

## Coming soon
- Monitoring stack (Prometheus, Grafana)
- Secrets management via Kubernetes Secrets Store CSI Driver and Google Secret Manager
- GitOps deployment with FluxCD


