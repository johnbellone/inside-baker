Inside Baker
============

Simple tool to bake enterprise disk images using [Vagrant][1], [Packer][2]
and [Chef][3].

The enterprise environment often has different limitations than a public or
home networking environment. There can often be issues installing software
due to security restrictions, corporate firewalls and proxies which cause
invalid SSL certificates.

Building a initial disk image which can be used with [Vagrant][1] allows for a
development team to prepare the environment as necessary and distribute quickly
and easily over [Amazon S3][5] or any other means.

## Boxen Support
Using the [Boxen][6] framework for configuring your development Mac we take
advantage of the Vagrant plugins for automatically adding the virtual machines
to the .dev domain using the [dnsmasq Vagrant plugin][7].

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
[5]: http://aws.amazon.com
[6]: http://boxen.github.com
[7]: https://github.com/mattes/vagrant-dnsmasq
