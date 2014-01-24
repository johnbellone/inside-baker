# Inject variables from an environment file which is embedded inside of the
# Vagrant box. This allows us to set default values for proxies, SSL, etc.
default_environment = File.expand_path('../.env', __FILE__)
begin
  require 'dotenv'
  Dotenv.load(default_environment)
rescue LoadError 
  abort <<-EOF
Failed attempting to load `dotenv` gem from within Vagrant.

Please install this explicitly by running:
        $ vagrant plugin install dotenv
EOF
end if File.exists?(default_environment)

# Specify default configuration for common plugins that may be used.
Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-berkshelf')
    config.berkshelf.enabled = true
    config.berkshelf.client_key = File.join(Dir.home, '.chef/client.pem')
  end

  if Vagrant.has_plugin?('vagrant-proxyconf')
    config.proxy.enabled = ENV.fetch('HTTP_PROXY', false)
  end
  
  if Vagrant.has_plugin?('vagrant-butcher')
    config.butcher.enabled = true
    config.butcher.verify_ssl = false    
    config.butcher.proxy = ENV.fetch('HTTP_PROXY', nil)
  end
end
