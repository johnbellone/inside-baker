Inside Baker
============

A set of tools to bake enterprise disk images using [Vagrant][1], [Packer][2]
and [Chef][3].

The enterprise environment often has different limitations than a public or
home networking environment. There can often be issues installing software
due to security restrictions, corporate firewalls and proxies which cause
invalid SSL certificates.

Building a initial disk image which can be used with [Vagrant][1] allows for a
development team to prepare the environment as necessary and distribute it to
the team.

## Requirements
* [VirtualBox 1.4.2 or newer][1]
* [Packer 0.5.1 or newer][2]

## Optional
* [VMWare Fusion][4]

## Usage

        $ bundle install --binstubs
        $ rake setup
        $ packer build -only=virtualbox -var-file=tmp/variables.json packer-template.json

[1]: http://vagrantup.com
[2]: http://packer.io
[3]: http://getchef.com
[4]: http://vmware.com
