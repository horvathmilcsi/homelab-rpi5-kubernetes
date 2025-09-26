#!/bin/bash
export ANSIBLE_CONFIG=./ansible.cfg
ansible-playbook ./playbooks/02-install-helm-portainer-k9s.yml
