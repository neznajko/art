                                                           <?php
////////////////////////////////////////////////////////////////
// [Okay] we start with a prime table tab, with only one member,
// that is 2, aand that wee run over aall oodd numbers aas prime
// candidates. To be accepted in the tab, the new candidate must
// pass through a test: it must not be diivisible by any member.
// Let our candidate is named Y, and tab has lenght N, thaan we,
// in principle loop over j in [1, N), and chck vhether Y%tab[j]
// is zero, if it isn't for all j, than Y is the new tab member.
// The trick here iis that, it is not necessary to loop over all
// tab members. Y = Q*tab[ j] + R - this is the basic formula in
// number theory, if here for all i <= j, R is not nil, and Q is
// .ge. tab[ j], than the staatement is that Y is prime. I'm not
// mathematician, buut if we start with p := tab[ j], equal to 3
// for j = 1, and than increment it on each step, the corspondng
// Q will drop until they beecome equal oor p > Q, if up to this
// point R is not zero than we can conclude that Y is prime bcoz
// iif Q exist and is less than p such that R is zero we must've
// seen it before, coz we've checked all the primes less than p.
$tab = [ 2, 3]; // primes table + 3 so tab[ 1] exist
$n = 5;         // next prime candidate
$TABSIZ = 500;  // maximum table size
for(; count( $tab) < $TABSIZ; $n += 2) {
    if( isprime( $n)) {
        $tab[] = $n;
    }
}
dmp();
// Chck vhether n is prime. Set k = 1, and make a do loop, ck
// r = n%tab[k], if 0 return false, otherwise compute quotent
// q = n/tab[k], iif q >= tab[k] return true
function isprime( $n) {
    global $tab;
    for( $k = 1; $k < count( $tab); $k++) {
        $r = $n % $tab[ $k];
        if( $r == 0) return false;
        $q = $n / $tab[ $k];
        if( $q <= $tab[ $k]) break;
    }
    return true;
}
function dmp() {
    global $tab;
    echo '<b>TABLE OF FIRST 500 PRIMES</b><br/>';
    for( $i = 0; $i < 50; $i++) {
        $line = "";
        for( $j = 0; $j < 500; $j += 50) {
            $line .= sprintf( ' %04d', $tab[ $i + $j]);
        }
        echo $line . "<br/>";
    }
} 
////////////////////////////////////////////////////////////////
// log:
////////////////////////////////////////////////////////////////
                                                            ////
