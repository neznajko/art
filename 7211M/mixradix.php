<?php
////////////////////////////////////////////////////////
$m = [ 0, 3, 4, 2 ];
$a = [ 0, 0, 0, 0 ];
$n = count( $a );
echo "php<br/>";
function dmp() {
    global $a, $n;
    $line = "";
    for( $j = 1; $j < $n; $j++ ){
        $line .= sprintf( ' %d', $a[ $j ]);
    }
    echo $line . "<br/>";
}
for(;;) {
    dmp();
    $j = $n - 1;
    while( $a[ $j ] + 1 == $m[ $j ]){
        $a[ $j ] = 0;
        $j--;
    }
    if( $j == 0 ) break;
    $a[ $j ]++;
}
////////////////////////////////////////////////////////
// -For running simple programs like this you don't need
// to install Apache Server, start the php's http server
// using the -S option, like thus: php -S 0.0.0.0:10000.
////////////////////////////////////////////////////////
?>
