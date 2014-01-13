# coding: utf-8
# If this is running in a environment which was bootstrapped using Boxen
# we want to make sure that we setup dnsmasq and the proper configuration.
def boxen?; ENV.include?('BOXEN_CONFIG_DIR'); end

Vagrant.require_plugin 'vagrant-berkshelf'
Vagrant.require_plugin 'vagrant-proxyconf'
Vagrant.require_plugin 'vagrant-butcher'
Vagrant.require_plugin 'vagrant-dnsmasq' if boxen?

# Inject variables from .env into the environment. This takes advantage
# of the vagrant-proxyconf plugin which handles it in guest machines.
require 'dotenv'
Dotenv.load

Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.butcher.enabled = true
  config.butcher.verify_ssl = false

  if boxen?
    config.dnsmasq.domain = '.dev'
    config.dnsmasq.dnsmasqconf = File.join(ENV['BOXEN_CONFIG_DIR'], '/dnsmasq/dnsmasq.conf')
  end
end
