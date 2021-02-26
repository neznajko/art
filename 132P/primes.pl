#!/usr/bin/env perl
use strict;
use warnings;

my @prime = (2,3);

sub isprime {
  my ($n) = @_;
  for (my $k = 1;; $k++) {
    my $p = $prime[$k];
    if ($n%$p ==  0) { return 0; }
    if ($n/$p <= $p) { return 1; }
  }
}
sub gen_primes {
  my ($size) = @_;
  for (my $n = 5; $#prime < $size; $n += 2) {
    if (isprime($n)) {
      push @prime, $n;
    }
  }
}
sub spit {
  my ($linez) = @_;
  my $size = $#prime;
  for (my $i = 0; $i < $linez; ++$i) {
    my $s = "";
    for (my $j = $i; $j < $size; $j += $linez) {
      $s = $s . sprintf(" %04d", $prime[$j]);
    }
    print "$s\n";
  }
}
gen_primes(500);
spit(50);
#log:
