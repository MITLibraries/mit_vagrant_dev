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
  config.vm.provision :shell, path: "install-ruby.sh", args: "2.6.1 bundler", privileged: false
  config.vm.provision :shell, path: "install-ruby.sh", args: "2.5.3 bundler", privileged: false
  config.vm.provision :shell, path: "install-heroku-cli.sh"
  config.vm.provision :shell, path: 'install-phantomjs.sh'
  config.vm.provision :shell, path: "install-python.sh", args: "3.7"
  config.vm.provision :shell, path: "install-python.sh", args: "3.6"

  config.vm.synced_folder ENV['SYNCED_FOLDER'] || "src", "/vagrant/src"

  # default puma and flask port
  config.vm.network 'forwarded_port', guest: 5000, host: 5000

  # default rails port
  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  # default jekyll port
  config.vm.network 'forwarded_port', guest: 4000, host: 4000

  # default django port
  config.vm.network 'forwarded_port', guest: 8000, host: 8000

  # fakes3 port (this is used for quicksubmit only)
  config.vm.network 'forwarded_port', guest: 10001, host: 10001
end
