MIT Libraries Development Rails Box
===
This repository contains a VagrantFile and support scripts that will configure
a local VM suitable for developing Rails applications.

What it installs
==
- apt packges necessary for typical rails developemnt
- rvm (to manage ruby versions)
- a version of ruby and the bunder gem
- the heroku command line interface tool

How to use it
==
On you local computer
- Install vagrant
- Clone this repo locally
- `vagrant up`
- git clone the repo you want to work on into `src`
  - NOTE: you can do this for multiple projects instead of having a VM for each.
- `vagrant ssh` gets you a shell on the rails vm
- Note: do all your development using your preferred tools on your local
computer. Do your `git` work on your local as well.

On the rails VM
- `cd /vagrant/src/YOUR_PROJECT`
- `bundle install` whenever you need to install gems
- `bin/rails test` to run tests
- `heroku local` to run a dev server. We use `heroku local` instead of
`bin/rails server` so we can easily load environement variables by dropping a
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
