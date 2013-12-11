#!/bin/sh

# for ruby
yum -y install bison zlib-devel openssl-devel
# for ab command
yum -y install httpd-tools

cat << EOS > /home/vagrant/.bashrc
export GOPATH=\$HOME/go
EOS

cat << EOS > /etc/profile.d/runtime.sh
export PATH=/usr/local/perl/bin:/usr/local/ruby/bin:/usr/local/go/bin:\$PATH
export GOROOT=/usr/local/go
EOS

if [ ! -e /usr/local/xbuild ]; then
  git clone git://github.com/tagomoris/xbuild.git /usr/local/xbuild
fi

if [ ! -e /usr/local/perl ]; then
  /usr/local/xbuild/perl-install 5.18.1 /usr/local/perl
fi

if [ ! -e /usr/local/ruby ]; then
  /usr/local/xbuild/ruby-install 2.0.0-p353 /usr/local/ruby
fi

if [ ! -e /usr/local/go ]; then
  curl https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz -o /usr/local/src/go1.2.linux-amd64.tar.gz
  tar -C /usr/local -xzf /usr/local/src/go1.2.linux-amd64.tar.gz
fi
