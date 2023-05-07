<?php
///////////////////////////////////////////////////////_
$f1  = "(acfg)(bcd)(aed)(fade)(bgfae)";
///////////////////////////////////////////////////////=
// 1-based offset from 'a'
function GetOffset( $c ){
    return ord( $c ) - ord( "a" ) + 1;
}
///////////////////////////////////////////////////////~
// get maximum 1-based offset from 'a' in f
function GetMaxOffset( $f ){
    $m = 0;
    for( $j = strlen( $f ) - 1; $j >= 0; $j-- ){
        $c = $f[ $j ];
        $offset = GetOffset( $c );
        $m = max( $m, $offset );
    }
    return $m;
}
///////////////////////////////////////////////////////^
function ConsTable( $n ){
    for( $j = 0; $j <= $n; $j++ ){
        $a[] = $j;
    }
    return $a;    
}
$n = GetMaxOffset( $f1 );
$j = -1;
$Z = -1;
$T = ConsTable( $n );
for( $k = strlen( $f1 ) - 1; $k >= 0; $k-- ){
    $c = $f1[ $k ];
    if( $c == ")" ){
        $Z = 0;
    } else if( $c == "("){
        $T[ $j ] = $Z;
    } else {
        $i = GetOffset( $c );
        [ $T[ $i ], $Z ] = [ $Z, $T[ $i ]];
        if( $T[ $i ] == 0 ){
            $j = $i;
        }
    }
}
print_r( $T );
///////////////////////////////////////////////////////>
// I think I'm going to drop MySQL:) and replace it with
// some other language:)
// Array ( [0] => 0 [1] => 4 [2] => 3 [3] => 5
//         [4] => 7 [5] => 2 [6] => 6 [7] => 1 )
?>
