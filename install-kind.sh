#!/bin/sh

#
# https://github.com/kubernetes-sigs/kind/releases/latest
#

## install kind:latest
KIND_VERSION="v0.9.0"
curl -Lo ./kind https://kind.sigs.k8s.io/dl/$KIND_VERSION/kind-$(uname)-amd64 --progress-bar
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version

## create a cluster
kind create cluster

