# coding: utf-8
task :setup do
  FileUtils.mkdir_p(['tmp', 'builds'])
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

  # TODO: Support more than just the standard Opscode Bento boxes.
  boxes_path = File.join(Dir.home, '.vagrant.d/boxes')
  virtualbox_path = File.join(boxes_path, 'opscode-ubuntu-12.04/virtualbox/box.ovf')
  vmware_path = Dir.glob(File.join(boxes_path, 'opscode-ubuntu-12.04/vmware_desktop/*.vmx')).first.chomp

  File.open('tmp/variables.json', 'w') do |file|
    file.write(<<-EOF)
{
        "virtualbox_source_path": "#{virtualbox_path}",
        "vmware_source_path": "#{vmware_path}"
}
EOF
  end
end
