#!/bin/sh

go get -u github.com/kentaro/delta
go build -a -o delta delta.go

bundle install --path=vendor/bundle
carton install

if [ `uname -s` = "Darwin" ]; then
  brew upgrade pcre

  if [ ! -e httpd-2.4.7.tar.gz ]; then
    wget http://ftp.tsukuba.wide.ad.jp/software/apache/httpd/httpd-2.4.7.tar.gz
    tar zxvf httpd-2.4.7.tar.gz
  fi
 
  if [ ! -e httpd-2.4.7/support/ab ]; then
    cd httpd-2.4.7/
    ./configure
    make
  fi
fi
