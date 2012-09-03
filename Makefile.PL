use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'myapp.pl',
  VERSION      => '1.0',
  AUTHOR       => 'mark phelan <phelanm@gmail.com>',
  EXE_FILES    => ['myapp.pl'],
  PREREQ_PM    => {'Mojolicious' => '2.0'},
  test         => {TESTS => 't/*.t'}
);
