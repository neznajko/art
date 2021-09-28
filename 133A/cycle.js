#! /usr/bin/env node
////////////////////////////////////////////////////////
var p = "(acfg)(bcd)(aed)(fade)(bgfae)".split( "" );
const n = p.length;
const back = n - 1;
var tag = new Array( n ).fill( '0' );
////////////////////////////////////////////////////////
function frst_pass() {
    var copy;
    for( let j = 0; j < n; ++j ){
        if( p[j] === '(' ){
            copy = p[j + 1];
            tag[j] = '1';
        }
        if( p[j] === ')' ){
            p[j] = copy;
            tag[j] = '1';
        }
    }
}
////////////////////////////////////////////////////////
function Cycle(){
    this.j = 0; // j: start position
    this.find = function ( cmp, i = this.j + 1 ) {
        // i - starting position
        for(; i < n; ++i ){
            if( cmp( i )) break;
        }
        return i;
    };
    this.main = function () {
        let out = "";
        // find first untagged
        let j = this.find( k => tag[k] === '0' );
        if( j === n ) return out; // no more
        this.j = j; // update for the next cycle
        out = `(${p[j]}`;
        let i = j;
        while( true ){
            tag[i] = '1';
            let key = p[i + 1];
            let cmp = k => p[k] === key;
            i = this.find( cmp, i + 2 );
            if( i === n ){
                if( key === p[j] )break;
                i = this.find( cmp );
                out += key;
            }
        }
        out += ")";
        return out;
    };
}
frst_pass();
var cycle = new Cycle();
var res = ""
while( true ){
    const out = cycle.main();
    if( out === "" )break;
    res += out;
}
console.log( res );
// log: Yeah!
