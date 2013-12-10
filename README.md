# Benchmark of Shadow Proxy Servers

## Setup

Just execute `setup.sh` as below:

```
$ ./setup.sh
```

It builds httpd for `ab` command that is used later and run `bundle install`, `carton install`, and `gom install` to install dependencies for each servers.

## Targets

This repository includes several shadow server implementation written in the languages below:

  * Perl: [Geest](https://github.com/lestrrat/p5-Geest)
  * Ruby: [Kage](https://github.com/cookpad/kage)
  * Go: [Delta](https://github.com/kentaro/delta)

You can run one of above as below:

```
$ bundle exec forman start {perl,ruby,go}
```

It starts a shadow proxy server (port 8080) and nginx (port 8081 and 8082). If you dispatch a request to http://127.0.0.1:8080/, the request will be copied and dispatched to both of the ports on which nginx is listening.

## Benchmark

I did benchmarking with the `ab` built from source instead of `/usr/sbin/ab` that was bundled with Mac OS X. For details, refer to the post below:

  * http://adventuresincoding.com/2012/05/how-to-get-apachebenchab-to-work-on-mac-os-x-lion

```
$ httpd-2.4.7/support/ab -n 1000 -c 100 http://127.0.0.1:8080/
```

## Benchmark Environment

### Hardware

```
$ system_profiler SPHardwareDataType
Hardware:

    Hardware Overview:

      Model Name: MacBook Air
      Model Identifier: MacBookAir4,1
      Processor Name: Intel Core i7
      Processor Speed: 1.8 GHz
      Number of Processors: 1
      Total Number of Cores: 2
      L2 Cache (per Core): 256 KB
      L3 Cache: 4 MB
      Memory: 4 GB
      Boot ROM Version: MBA41.0077.B0F
      SMC Version (system): 1.74f4
      Serial Number (system): C02H306DDJY9
      Hardware UUID: 864C39E2-68B9-5F2B-810C-BAA29E0267E1
```

### Softwares

#### nginx

```
$ nginx -v
nginx version: nginx/1.4.4
```

#### Perl

```
$ perl -v

This is perl 5, version 18, subversion 1 (v5.18.1) built for darwin-2level
```

#### Ruby

```
$ ruby -v
ruby 2.0.0p353 (2013-11-22 revision 43784) [x86_64-darwin13.0.0]
```

#### Go

```
$ go version
go version go1.2 darwin/amd64
```

## Trouble Shooting

If you have a problem with building httpd on Mavericks, try below:

```
cd /Applications/Xcode.app/Contents/Developer/Toolchains/
sudo ln -s XcodeDefault.xctoolchain OSX10.9.xctoolchain
```
