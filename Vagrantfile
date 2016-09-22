# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.2"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum install -y deltarpm
    yum install -y open-vm-tools docker git

    which oc || curl --location --fail -# https://github.com/openshift/origin/releases/download/v1.3.0/openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit.tar.gz | tar xzfO - openshift-origin-client-tools-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit/oc > /usr/bin/oc && chmod +x /usr/bin/oc

    which s2i || curl --location --fail -# https://github.com/openshift/source-to-image/releases/download/v1.1.1/source-to-image-v1.1.1-724c0dd-linux-amd64.tar.gz | tar xzfO - ./s2i > /usr/bin/s2i && chmod +x /usr/bin/s2i

    systemctl start docker.service
  SHELL
end
