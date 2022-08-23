#!/usr/bin/env perl
my $m = 2166;
my $n = 6099;
#
my $c = $m;
my $d = $n;
#
my $A = 1;
my $B = 0;
my $a = 0;
my $b = 1;
# Am + Bn = c
# am + bn = d
sub reduce {
    my ($a, $A, $q) = @_;
    my $t = $A;
    $A = $a;
    $a = $t - $q*$a;
    return ($a, $A);
}
while( 3.141592653589793238 ){
    my $q = int( $c / $d );
    my $r = $c % $d;
    if ($r == 0) {
        last;
    }
    $c = $d;
    $d = $r;
    ($a, $A) = reduce( $a, $A, $q);
    ($b, $B) = reduce( $b, $B, $q);
}
print "$a*$m + $b*$n = $d\n";
################################################################
# log: -That joke with NASA.. haha!
