#!/usr/bin/env -S perl -l
################################################################
use strict;
use warnings;
use feature 'state';
################################################################
my $f1 = "(acfg)(bcd)(aed)(fade)(bgfae)";
################################################################
sub get_char_offset {
    state $base_ascii_code = ord( '`' );
    my ($char) = @_;
    return ord( $char ) - $base_ascii_code;
}
################################################################
sub get_max_offset {
    my $max_offset = 0;
    for( my $i = length( $f1 ) - 1; $i >= 0; --$i ){
        my $char = substr( $f1, $i, 1 );
        my $char_offset = get_char_offset $char;
        if( $char_offset > $max_offset ){
            $max_offset = $char_offset;
        }
    }
    return $max_offset;
}
################################################################
my $n = get_max_offset();
my @T = (0..$n);
################################################################
#      ( a c f g ) ( b c d ) ( a e d ) ( f a d e ) ( b g f a e )
# a -> d d a a a a a a a a a a a d d d d d d e e e e e e e e a a
# b -> c c c c c c c c g g g g g g g g g g g g g g g g b b b b b
# c -> e e e d d d d d d c c c c c c c c c c c c c c c c c c c c
# d -> g g g g g g g ) ) ) d d ) ) ) b b b b b d d d d d d d d d
# e -> b b b b b b b b b b b b b b a a a ) ) ) ) b b ) ) ) ) ) e
# f -> f f f f e e e e e e e e e e e e e e a a a a a a a a f f f
# g -> a ) ) ) ) f f f f f f f f f f f f f f f f f f f f g g g g
################################################################
#        .     `    ,   .    -     -    ,       :    -  
# Frankly don't know how many times I've written this algorithm,
# but still don't understand the logic:)
#    -     `     .          -   _
################################################################
my ($Z, $j);
for( my $i = length( $f1 ) - 1; $i >= 0; --$i ){
    my $char = substr( $f1, $i, 1 );
    if( $char eq '(' ){
        $T[$j] = $Z;
    } elsif( $char eq ')' ){
        $Z = 0;
    } else {
        my $i = get_char_offset $char;
        ( $T[$i], $Z ) = ( $Z, $T[$i] );
        if( $T[$i] == 0 ){
            $j = $i;
        }
    }
}
################################################################
print join( ", ", @T );
################################################################
