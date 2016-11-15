# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.provision :shell, path: "provision.sh"
  config.vm.provision :shell, path: "install-rvm.sh", args: "stable", privileged: false
  config.vm.provision :shell, path: "install-ruby.sh", args: "2.3.1 bundle", privileged: false
  config.vm.provision :shell, path: "install-heroku-cli.sh"

  config.vm.synced_folder ENV['SYNCED_FOLDER'] || "src", "/vagrant/src"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
end
