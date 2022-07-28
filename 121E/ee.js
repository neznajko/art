#! /usr/bin/env node
////////////////////////////////////////////////////////////////
function ee( m, n ){
// Am + Bn = c, 
// am + bn = d
    let A = 1, B = 0;
    let a = 0, b = 1;
    let c = m, d = n;
    while( true ){
        const q = Math.floor( c/d );
        const r = c%d;
        if( r == 0 ) break;
        // reduction
        let t = A;
        A = a;
        a = t - q*a;
        t = B;
        B = b;
        b = t - q*b;
        c = d;
        d = r; 
    }
    console.log(`${a}*${m} + ${b}*${n} = ${d}`);
}
ee( 2166 , 6099 );
////////////////////////////////////////////////////////////////
// log: - The main problem in this World is that aggression goes
// always from the top to the bottom, always against weakest and
// defenseless, e.g.: Putin vs. Ukraine, Trump vs. Transgenders,
// Men vs. Women etc. To move forward, as Human Kind, we have to
// encourage the good aggression; to climb mountains from bottom
// to the top.

