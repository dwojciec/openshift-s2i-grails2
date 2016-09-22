#!/bin/bash -e

mkdir -p ${HOME}/bin
curl --location --fail -# https://github.com/openshift/source-to-image/releases/download/v1.1.1/source-to-image-v1.1.1-724c0dd-linux-amd64.tar.gz | tar -C ${HOME}/bin -xzf -

