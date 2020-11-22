$script = <<-'EOF'
sudo /vagrant/install_virtualbox.sh
sudo /vagrant/install_hashicorp_packages.sh vagrant packer
vboxmanage --version
vagrant version
packer version
EOF


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", inline: $script
end
