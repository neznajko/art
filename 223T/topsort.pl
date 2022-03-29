#!                                                 /usr/bin/perl
################################################################
use warnings;
use strict;
use feature 'state'; # static variables
################################################################
my $filename = "./paper.dev";
#
open my $fh, "<", $filename or die "$filename: $!";
#
my $bufr = "";
#
while( my $line = <$fh>) { # Perl is the most funny language.
    chomp $line;           # 
    $bufr .= $line;        # 
}                          #
#
close $fh;
################################################################
my $MIXW = 5; # No. bytes in MIX words., cos the input file to
              # be consistent with the mixal program.
sub getnext {
    state $j = 0;
    $j += $MIXW;
    return 0 + substr $bufr, $j - $MIXW, $MIXW;
}
getnext(); # dummy record for padding, bcoz block size of mixal
# paper is 14, if not mistaken, words; and the input is in the
# form: u->v pairs,, for same reason the sentinel is 0, 0.
my $n = getnext();
print "No. vertices: $n\n";
####_###########################################################
my @cpre = (); # predecessor counters;
my @sucv = (); # successive lists
my $queue = \@cpre; # the queue trick
for( my $j = 0; $j <= $n; $j++) {
    push @cpre, 0;
    push @sucv, [];
}
sub insert_coin {
    my ($u, $v) = @_; # function arguments
    push @{$sucv[ $u]}, $v;
}
# build data structure #########################################
for( ;;) {
    my $u = getnext();
    my $v = getnext();
    if( $u == $v) {
        last;
    }
    $cpre[ $v]++; # increment ::v predecessors counter
    insert_coin( $u, $v); # push the tempo
}
sub dmp {
    for( my $j = 0; $j <= $n; $j++) {
        print "$j: ($cpre[ $j]) @{$sucv[ $j]}\n";
    }
}
dmp(); ########################################## fill the queue
my $r = 0; # rear pointer
for( my $j = 0; $j <= $n; $j++) {
    if( $cpre[ $j] == 0) {
        $r = $queue->[ $r] = $j;
    }
}
# Start poping #################################################
my $f = $queue->[ 0]; # front
print "topsort:";
while( $f != 0) {
    print " $f";
    # Decrement just pooped up ::f successors counters, and if
    # they become nil add them to the queue.
    for (@{$sucv[ $f]}) { # Here we have an example of three
        # different consecutive parenthesis.
        $cpre[ $_]--;
        if( $cpre[ $_] == 0) {
            $r = $queue->[ $r] = $_;
        }
    }
    $f = $queue->[ $f]; # moo forward
}
print "\n";
################################################################
