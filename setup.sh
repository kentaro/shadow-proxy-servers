#!/bin/sh

gom install
gom build delta.go

bundle install --path=vendor/bundle
carton install
