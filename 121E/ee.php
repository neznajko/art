<?php
////////////////////////////////////////////////////////
function ee( $m, $n ) {
    // algorithm invariants:
    // Am + Bn = c
    // am + bn = d
    $A = 1; $B = 0; $c = $m; // Ok
    $a = 0; $b = 1; $d = $n;
    // here we go
    while( true ){
        $q = floor( $c/$d );
        $r = $c%$d;
        if( $r == 0 )break;
        // Reduction:
        $t = $A; $A = $a; $a = $t - $q*$a; // o_o
        $t = $B; $B = $b; $b = $t - $q*$b;
        $c = $d; $d = $r;           
    }
    echo "(a=$a)(m=$m) + (b=$b)(n=$n) = (d=$d)<br/>";
}
ee( 2166 , 6099 );
////////////////////////////////////////////////////////
?>
