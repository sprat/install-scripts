$script = <<-'EOF'
sudo /vagrant/install_virtualbox.sh
sudo /vagrant/install_hashicorp_repo.sh
sudo apt-get update -qq && sudo apt-get install -yq vagrant packer
EOF


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", inline: $script
end
