#!/bin/sh

go get -u github.com/kentaro/delta
go build -o delta delta.go

bundle install --path=vendor/bundle
carton install
