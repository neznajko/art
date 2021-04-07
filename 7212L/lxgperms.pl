#!/usr/bin/env perl
@a = ( 0, 1, 2, 2, 4 );
sub swow
{
  my ( $i, $j ) = @_;
  $t = $a[$i]; $a[$i] = $a[$j]; $a[$j] = $t;
}
sub nextperm
{
  $n = $#a; # back
  # [ find j ]
  $j = $n - 1;
  for( ; $a[$j] >= $a[$j + 1]; --$j ){}
  if( $j == 0 ){ return 0; }
  # [ increace a[j] ]
  $r = $n;
  for( ; $a[$j] >= $a[$r]; --$r ){}
  swow( $j, $r );
  # [ reverse ]
  for( $r = $n, ++$j; $j < $r; ++$j, --$r ){
    swow( $j, $r );
  }
  return 1;
}
do {
  print "@a[1..$#a]\n";
} while (nextperm() > 0);

#log: that's an odd language, have to read a book:)
