A Virtual Machine for Rails development

This VM has been created for Ruby/Rails programming at Slate Horse training events. It includes:

- Git
- Node 
- Postgres
- RabbitMQ
- Redis
- Ruby 2.3

## Prerequisites

1. [VirtualBox](https://www.virtualbox.org)
2. [Vagrant](https://vagrantup.com)
3. [Git](https://git-scm.com/)

## Using the VM

On the host machine:

```bash
git clone https://github.com/slatehorse/rails-dev-vm.git
cd rails-dev-vm
vagrant up
# ... once it's created, you can access the VM with:
vagrant ssh
```

### Installing from a packaged Vagrant box

If we're having network issues and pass around a USB drive with the Vagrant box on, you can import it with:

1. Copy the file onto your computer and pass the USB drive on.
2. Run `vagrant box add /path/to/slatehorse-rails-dev-vm.box --name slatehorse/rails-dev-vm` to add the packaged box to your Vagrant setup.
3. Create a directory for your VM, and open a terminal inside that directory.
4. Run `vagrant init slatehorse/rails-dev-vm` to create a Vagrant project in the directory.

You can then use `vagrant up` and `vagrant ssh` as you would for the standard approach above.

> _Note:_ If we use this approach, we'll need to download the files for the first workshop (Ruby Koans), but we'll cover that at the time.

## Packaging the VM for distribution

We use a different Vagrantfile to package the VM so that the bootstrap scripts and setup aren't run twice.

```bash
vagrant package --output slatehorse-rails-dev-vm.box --vagrantfile Vagrantfile.packaged
```

## Credit

The core of `bootstrap.sh` is taken from [rails/rails-dev-box](https://github.com/rails/rails-dev-box).