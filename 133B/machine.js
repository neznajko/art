////////////////////////////////////////////////////////////////
// a b c d e f g
// 1 2 3 4 5 6 7
////////////////////////////////////////////////////////////////
const off = ch => 1 + ch.charCodeAt(0) - 'a'.charCodeAt(0);
const f1 = "(acfg)(bcd)(aed)(fade)(bgfae)";
const n  = off( 'g' );
// B1. [Initialize] Set T[k] <- k, for 1 <= k <= n. Prepare to
// scan the input from right to left.
const T = Array.from({ length: n + 1 }, ( _, j ) => j );
// B2. [Next element] Get next element, if input is exhausted,
// terminate the algorithm. If the character is ), set Z <- 0,
// and repeat B2, if it is ( go to B4, otherwise it is Xi for
// some i. Move to B3.
////////////////////////////////////////////////////////////////
let Z, j;
for( let k = f1.length - 1; k >= 0; k-- ){
    const ch = f1[k];
    if( ch == ')' ){
        Z = 0;
    } else if( ch == '(' ){
        // B4. [Change T[j]] Set T[j] <- Z. Go to B2.
        T[j] = Z;
    } else {
////////////////////////////////////////////////////////////////
        // B3. [Change T[i]] Exchange T[i] and Z, if this makes
        // T[i] nil, set j <- i. Go to B2.
        const i = off( ch );
        const t = T[i]; T[i] = Z; Z = t;
        if( T[i] == 0 ) j = i;
    }
}
console.log( T );
///////////////////////////////////////////////////////////////=
// log:
//
