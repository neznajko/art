#! /usr/bin/env perl
my ($m, $n) = @ARGV;
#
if (not defined $m) {
    $m = 2166;
}
if (not defined $n) {
    $n = 6099;
}
my $s = "GCD($m,$n)="; # output string
#
if ($m < $n) { # E0
    $m, $n = $n, $m;
}
my $r = 0;
while (true) {
    $r = $m % $n;
    if ($r == 0) {
        last;
    }
    $m = $n;
    $n = $r;
}
print "$s$n\n";
# log:
