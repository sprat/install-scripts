$script = <<-'EOF'
sudo /vagrant/add_virtualbox_repo.sh
sudo /vagrant/add_hashicorp_repo.sh
sudo apt-get update -qq && sudo apt-get install -yq virtualbox-6.1 vagrant packer
EOF


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", inline: $script
end
