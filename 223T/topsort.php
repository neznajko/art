<?php
////////////////////////////////////////////////////////
print "Topological Sorting<br>";
////////////////////////////////////////////////////////
class Node {
    public $info;
    public $next;
    function __construct( $info=0, $next=null) {
        $this->info = $info;
        $this->next = $next;
    }
    function insert_coin( $info) {
        $node = new Node( $info, $this->next);
        $this->next = $node;
    }
    function dmp() {
        print "{$this->info}:";
        $p = $this->next;
        while( $p != null) {
            print " {$p->info}";
            $p = $p->next;
        }
        print "<br>";
    }
    function inc() {
        $this->info++;
    }
}
$buf = file_get_contents( "./paper.dev");
function getnode() {
    global $buf;
    static $j = 0;    // current offset
    static $WSIZ = 5; // word size
    if( $buf[ $j] == "\n") $j++;   
    $subzero = substr( $buf, $j, $WSIZ);
    $j += $WSIZ;
    return intval( $subzero);
}
getnode(); // dummy record
$n = getnode(); // number of nodes
for( $j = 0; $j <= $n; $j++) {
    $top[] = new Node();
}
while( true) {
    $u = getnode(); // u -> v
    $v = getnode();
    if( $u == $v) break;
    $top[ $v]->inc();
    $top[ $u]->insert_coin( $v);
}
$r = 0;
for( $j = 1; $j <= $n; $j++) {
    if( $top[ $j]->info == 0) {
        $r = $top[ $r]->info = $j;
    }
}
$f = 0;
while( $top[ $f]->info != 0) {
    $f = $top[ $f]->info;
    print "$f<br>";
    $node = $top[ $f]->next;
    while( $node != null) {
        $u = $node->info;
        if( --$top[ $u]->info == 0) {
            $r = $top[ $r]->info = $u;
        }
        $node = $node->next;
    }    
}
////////////////////////////////////////////////////////
// log:
////////////////////////////////////////////////////////
?>
