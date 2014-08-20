#!/bin/bash -eux

# VBoxManage unregistervm "packer-debian-7.x-amd64" --delete
VBoxManage import packer-debian-7.x-amd64-virtualbox/packer-debian-7.x-amd64.ovf
VBoxManage list vms
