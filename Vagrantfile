# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/yakkety64'
  config.vm.hostname = 'slatehorse-dev-vm'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.network 'forwarded_port', guest: 15_672, host: 15_672

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end
end
