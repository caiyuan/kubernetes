#!/bin/sh

## install golang:latest
GO_PKG="go1.15.2.linux-amd64.tar.gz"
curl https://mirrors.ustc.edu.cn/golang/$GO_PKG -o $GO_PKG --progress-bar
tar -C /usr/local -xzf $GO_PKG
sudo ln -s /usr/local/go/bin/go /usr/local/bin/go
go version

## goproxy china
go env -w GO111MODULE="on"
go env -w GOPROXY="https://goproxy.cn,direct"

## install kind:latest
KIND_VERSION="v0.9.0"
GO111MODULE="on" go get sigs.k8s.io/kind@$KIND_VERSION
sudo ln -s "$(go env GOPATH)/bin/kind" /usr/local/bin/kind
kind version

## create a cluster
kind create cluster

