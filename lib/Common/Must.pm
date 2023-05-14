package Common::Must;
use strict;
use warnings;

use feature qw/say/;

sub import {
  my $class = shift;
  strict->import();
  'warnings'->import();

  return;
}

1;