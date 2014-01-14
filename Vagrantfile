# Inject variables from an environment file which is embedded inside of the
# Vagrant box. This allows us to set default values for proxies, SSL, etc.
default_environment = File.expand_path('../.env', __FILE__)
begin
  require 'dotenv'
  Dotenv.load(default_environment)
rescue LoadError 
  abort "Failed loading environment: #{default_environment}"
end if File.exists?(default_environment)

# Specify default configuration for common plugins that may be used.
Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true if Vagrant.has_plugin?('vagrant-berkshelf')
  config.proxy.enabled = true if Vagrant.has_plugin?('vagrant-proxyconf')

  if Vagrant.has_plugin?('vagrant-butcher')
    config.butcher.enabled = true
    config.butcher.verify_ssl = false    
  end

  # Automatically add the virtual machine to the local dnsmasq daemon if it
  # and the plugin have been installed. 
  if Vagrant.has_plugin?('vagrant-dnsmasq')
    config.dnsmasq.domain = '.dev'
    config.dnsmasq.dnsmasqconf = File.join(ENV['BOXEN_CONFIG_DIR'], '/dnsmasq/dnsmasq.conf') if boxen?
  end
end
