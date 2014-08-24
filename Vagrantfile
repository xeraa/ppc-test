# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"


  # Create a forwarded port mapping.
  config.vm.network "forwarded_port", guest: 80, host: 8080


  # Fox https://github.com/mitchellh/vagrant/issues/1673
  config.ssh.pty = true


  # Install the dependencies
  config.vm.provision "shell", :path => "provision.sh"


end
