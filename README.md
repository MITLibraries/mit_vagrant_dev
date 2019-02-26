MIT Libraries Development Rails/Python Box
===
This repository contains a VagrantFile and support scripts that will configure
a local VM suitable for developing Rails and Python applications.

What it installs
==
- apt packages necessary for typical rails and python development
- rvm (to manage ruby versions)
- a version of ruby and the bundler gem
- a version of python, pipenv, and tox
- the heroku command line interface tool

How to use it
==
On your local computer
- Install [Virtualbox](https://www.virtualbox.org)
- Install [Vagrant](https://www.vagrantup.com)
- Clone this repo locally
- `vagrant up` in the cloned directory of this repo
  - NOTE: if you don't like the default of `src`, you can use `SYNCED_FOLDER` ENV
  - EXAMPLE: `SYNCED_FOLDER="~/projects" vagrant up`
- git clone the repo you want to work on into `src`
  - NOTE: if you changed with `ENV['SYNCED_FOLDER']` wherever you change it to
  - NOTE: you can sync a directory containing multiple projects instead of having a VM for each.
- `vagrant ssh` gets you a shell on the rails vm
- Note: do all your development using your preferred tools on your local
computer. Do your `git` work on your local as well.
- `vagrant halt` when you want to shutdown the vm (`vagrant up` to bring it
   back)

On the rails/python VM
- `cd /vagrant/src/YOUR_PROJECT` gets you to the linked directory
- Rails:
  - `bundle install` whenever you need to install gems
  - `bin/rails test` to run tests
- Python:
  - `pipenv install` to create a virtualenv and install project dependencies
  - `tox` to run tests (usually, may vary by project)
- `heroku local` to run a dev server. We use `heroku local` instead of
`bin/rails server` so we can easily load environment variables by dropping a
`.env` file in `src` on your local (or `/vagrant/src/YOUR_PROJECT` in the vm
as they are the same thing)

Caveats
==
This does not use Ansible due to a requirement to work on Windows.

Making Changes
==
If you end up needing additional packages installed to get gems to work,
adding them to the `provision.sh` will probably make it easier later if it's a
fairly common gem.

Multiple Ruby Versions
==
If you are working on projects that use a different version of ruby than is
installed by default, you can:
- `rvm install 2.4.2` (replace `2.4.2` with the version you need)
- `gem install bundler`
- if your projects use `.ruby-version` files you are now all set and ruby will
  be switched to the version each project needs automatically

Multiple Python versions
==
If you are working on projects that use a different version of python than is
installed by default, you can:
- update the Vagrantfile with additional python provisioning lines, e.g. `config.vm.provision :shell, path: "install-python.sh", args: "3.6"` to install Python 3.6
- run `vagrant provision` from your local computer to install
- if your projects set a Python version in the Pipfile (e.g. `[requires] python_version = "3.6"`) you are now all set and pipenv will switch to the version each project needs automatically
