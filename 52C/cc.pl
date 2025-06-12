#!/usr/bin/env                                      perl
########################################################
use strict;   ##########################################
use warnings; ##########################################
use utf8;     ##########################################
########################################################
my @a = ( 0, 5, 7, 8, 9, 2, 6, 1, 3, 4 );
my $n = $#a;
my @c = ( 0 )x( $n + 1 );
for( my $i = $n; $i > 1; --$i ){
    for( my $j = $i - 1; $j > 0; --$j ){
        if( $a[$i] < $a[$j] ){
            ++$c[$j];
        } else {
            ++$c[$i];
        }
    }
}
print "@a\n@c\n";
########################################################
########################################################
########################################################
########################################################
# Recently have watched some YouTube v i d e o from some
# physicist talking about fractals and trees l i f e and
# stuff. I m i g h t be w r o n g, but had left with the
# impression that he wanted to present fractals as trees
# I took i t personally:) Trees are very restricted data
# structure, they have no loops directed edges and so on
# and are d e f i n e d as finite set of n o d e s, both
# structures are recursive but at best t r e e s can b e
# viewed as subset of fractals; the other question w a s
# about that philosophically there is n o definition o f
# life and not life. In all.ora w e have stated that the
# meaning of life i s love and the meaning of l o v e is
# life, that i s life wants to continue its existence by
# means of love which c a n be v i e w e d as a state of
# balance with its environment, in the c l i p he gave a
# counter e x a m p l e with a fire that also replicates
# itself, my question i s what will happen if everything
# burns and t h e whole Earth is in f l a m e s? Fire is
# destroying i t s future existence n o t preserving i t
########################################################
########################################################
########################################################
########################################################
