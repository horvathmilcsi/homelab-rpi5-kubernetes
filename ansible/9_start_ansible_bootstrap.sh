#!/bin/bash
export ANSIBLE_CONFIG=./ansible.cfg
ansible-playbook ./playbooks/bootstrap.yml
