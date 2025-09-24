# homelab-rpi5-kubernetes
My kubernetes homelab for my Raspberry pi 5

## Purpose  
1) Install Ansible on Rpi5
2) Install K3S Kubernetes Rpi5 (via Ansible)

## Prerequisites  
1) have a linux OS on your Raspberry Pi 5 (I tested with Raspberr Pi OS, that is a Debian GNU/Linux 12 bookworm under the hood)

## How to use
1) ssh into your rpi5
2) mkdir ~/repos/   ###  Create a new parent folder for this git repo
3) cd ~/repos/
4) git pull https://github.com/horvathmilcsi/homelab-rpi5-kubernetes.git
5) cd homelab-rpi5-kubernetes/
7) ./1_bootstrap_linux/2_install_ansible.sh   ### this will install Ansible
8)  cd ansible/
9) ./9_start_ansible_bootstrap.sh   ### this will install k3s and all its dependencies and configs via Ansible
10) if no errors shown, restart your rpi5 by the next command. If errors, then fix the errors first
11) sudo reboot
12) ssh into your rpi5
13) kubectl get nodes   ### this should give an output and no errors



