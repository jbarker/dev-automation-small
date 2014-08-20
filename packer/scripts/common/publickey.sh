#!/bin/bash

mkdir /home/packer/.ssh
wget --no-check-certificate \
    'https://github.com/jbarker.keys' \
    -O /home/packer/.ssh/authorized_keys
chown -R packer /home/packer/.ssh
chmod -R go-rwsx /home/packer/.ssh
