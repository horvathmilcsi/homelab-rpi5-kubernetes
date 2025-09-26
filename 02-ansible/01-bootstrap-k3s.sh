#!/bin/bash
export ANSIBLE_CONFIG=./ansible.cfg
ansible-playbook ./playbooks/01-bootstrap-k3s.yml
