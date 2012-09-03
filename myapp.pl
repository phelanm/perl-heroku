#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => {text => 'Hello phelanm Mojo!'};

app->start;
