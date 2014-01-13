# coding: utf-8
task :setup do 
  File.open('.env', 'w') do |file|
    file.write(<<-EOF)
CHEF_ENV=dev
VAGRANT_HTTP_PROXY=$HTTPS_PROXY
VAGRANT_HTTPS_PROXY=$HTTPS_PROXY
VAGRANT_ENV_HTTP_PROXY=$HTTPS_PROXY
VAGRANT_ENV_HTTPS_PROXY=$HTTPS_PROXY
VAGRANT_YUM_HTTP_PROXY=$HTTPS_PROXY
VAGRANT_GIT_HTTP_PROXY=$HTTPS_PROXY
VAGRANT_NO_PROXY=localhost,127.0.0.1,.dev,$NO_PROXY
EOF
  end
end

namespace :packer do
  task :template do
    virtualbox_path = File.join(Dir.home, '.vagrant.d/boxes/opscode-centos-6.5/virtualbox')
    vmware_path = File.join(Dir.home, '.vagrant.d/boxes/opscode-centos-6.5/vmware')

    File.open('tmp/variables.json', 'w') do |file|
      file.write(<<-EOF)
{
        "virtualbox_source_path": "#{virtualbox_path}/box.ovf",
        "vmware_source_path": "#{vmware_path}/box.vtf"
}
EOF
    end
  end

  task :build => :template do
    %x[packer build -var-file=tmp/variables.json packer-template.json]
  end
end
