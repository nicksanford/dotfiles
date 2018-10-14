# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/testing64"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder ".", "/vagrant", type: "nfs"

   config.vm.provider "virtualbox" do |vb|
     vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
     vb.memory = "4096"
   end

  config.vm.provision :shell, path: "bootstrap.sh", privileged: false

  config.ssh.forward_x11 = true
end
