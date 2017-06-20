# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu/xenial64'

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.provision :shell, path: "provision.sh"
  config.vm.provision :shell, path: "install-rvm.sh", args: "stable", privileged: false
  config.vm.provision :shell, path: "install-ruby.sh", args: "2.4.1 bundle", privileged: false
  config.vm.provision :shell, path: "install-heroku-cli.sh"
  config.vm.provision :shell, path: 'install-phantomjs.sh'

  config.vm.synced_folder ENV['SYNCED_FOLDER'] || "src", "/vagrant/src"

  # puma port
  config.vm.network 'forwarded_port', guest: 5000, host: 5000

  # fakes3 port
  config.vm.network 'forwarded_port', guest: 10001, host: 10001
end
