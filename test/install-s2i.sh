#!/bin/bash -e

if ! which go >/dev/null; then
  curl --location --fail -# https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar -C /usr/local -xzf -
  export PATH=${PATH}:/usr/local/go/bin
fi

export GOPATH=${HOME}/go
go get github.com/openshift/source-to-image
${GOPATH}/src/github.com/openshift/source-to-image/hack/build-go.sh
mkdir -p ${HOME}/bin
cp ${GOPATH}/src/github.com/openshift/source-to-image/_output/local/bin/linux/amd64/s2i ${HOME}/bin/s2i

