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

## Credit

The core of `bootstrap.sh` is taken from [rails/rails-dev-box](https://github.com/rails/rails-dev-box).