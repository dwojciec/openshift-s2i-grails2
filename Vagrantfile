# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.provision "shell", inline: <<-SHELL
    yum install -y deltarpm
    yum install -y open-vm-tools

    export GOPATH=/root/gopath
    mkdir -p ${GOPATH}
    yum install -y docker git golang

    which oc || curl --location --fail https://github.com/openshift/origin/releases/download/v1.2.0/openshift-origin-client-tools-v1.2.0-2e62fab-linux-64bit.tar.gz | tar xzfO - openshift-origin-client-tools-v1.2.0-2e62fab-linux-64bit/oc > /usr/bin/oc && chmod +x /usr/bin/oc

    go get github.com/openshift/source-to-image
    ${GOPATH}/src/github.com/openshift/source-to-image/hack/build-go.sh
    cp ${GOPATH}/src/github.com/openshift/source-to-image/_output/local/bin/linux/amd64/s2i /usr/bin/s2i

    systemctl start docker.service
  SHELL
end
