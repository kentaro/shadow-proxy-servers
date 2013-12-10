#!/bin/sh

# gom: https://github.com/mattn/gom
gom install
gom build -o delta delta.go

bundle install --path=vendor/bundle
carton install
