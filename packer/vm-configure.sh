#!/bin/bash -eux

VBoxManage modifyvm "packer-debian-7.x-amd64" --natpf1 "http,tcp,,3080,,80"
