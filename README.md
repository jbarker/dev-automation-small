# dev-automation-small

*Developer automation in the small.*

An example of integrated tools for machine configuration, local software
development, and deployment to a cloud hosting provider.

## Overview

* Operating System: [Debian Wheezy][wheezy] 7.x AMD64
* System definition: [Packer][packer]
   * Builders
     * [VirtualBox][packer_virtualbox]
   * Provisioners
     * [Ansible][packer_ansible]

[wheezy]: https://www.debian.org/releases/wheezy/

[packer]: http://www.packer.io/

[packer_virtualbox]: http://www.packer.io/docs/builders/virtualbox.html

[packer_digitalocean]: http://www.packer.io/docs/builders/digitalocean.html

[packer_ansible]: http://www.packer.io/docs/provisioners/ansible-local.html


## Setup on a Mac

You may run `setup-mac.sh` to install the required tools on a Mac.

     $ ./setup-mac.sh

This example has been created & verified on Mac OS X 10.9.x.


## Configuring your SSH public key

You must update the script at `/packer/scripts/common/publickey.sh` to copy
your public key. This will allow Ansible to access your machines. Without this
change Ansible will attempt to use the default public key, and you will not be
able to access your machines.

You must also update your local SSH configuration. In your local file
`~/.ssh/config` add an entry that tells SSH to use your private key when
connecting to your virtual machine:

    Host localhost
    HostName localhost
    Port 3022
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa
    TCPKeepAlive yes
    User packer

You should edit the above line `IdentityFile ~/.ssh/id_rsa` so that the file path is your private key that matches your public key configured in the script at `/packer/scripts/common/publickey.sh`.


## Build a machine for VirtualBox

Use `packer` to configure machines. First, confirm the packer template file is valid.

    $ cd packer
    $ packer validate debian-7.x-amd64.json
    Template validated successfully.

Build with `virtualbox-iso` to configure local machines for development use.

    $ packer build -only=virtualbox-iso -force debian-7.x-amd64.json


## Run a machine with VirtualBox

You may run the machine with VirtualBox. First, import the newly built machine:

     $ cd packer
     $ ./vm-import.sh

Then, run the virtual machine:

     $ ./vm-start.sh

The virtual machine will run in headless mode, no UI should be visible.


## Configure a machine with Ansible

Use `ansible` for configuration management of machines.

When your machines are running, you may connect to them via SSH and configure
them with Ansible.

You may setup your machines with the command:

    $ cd ansible
    $ ansible -i inventory.ini all -m setup -vvvv

You may ping your machines with the command:

    $ ansible -i inventory.ini all -m ping


## Related

* Presentation from [ebay tech talk Berlin][meetup] (21 August 2014)
  * PDF: under the `doc` directory
  * Sharing: at [SlideShare][slideshare]
* [Blog post][blog] at jbarker.com


## Resources

* [Bento][bento] by OpsCode


[bento]: https://opscode.github.io/bento/
[meetup]: http://meetu.ps/2vCs1K
[slideshare]: http://www.slideshare.net/jbrkr/automation-smallcodeclouddevops
[blog]: http://www.jbarker.com/blog/2014/ebay-berlin-devops-cloud
