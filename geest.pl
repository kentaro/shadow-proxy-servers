#!/usr/bin/env perl
use strict;
use warnings;
use Geest;

my $server = Geest->new;

$server->add_master(production => (
    host => '127.0.0.1',
    port => 8081,
));
$server->add_backend(staging => (
    host => '127.0.0.1',
    port => 8082,
));
$server->on(select_backend => sub {
    return [qw(staging production)];
});

$server->psgi_app;
