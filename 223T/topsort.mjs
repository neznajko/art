#!                                             /usr/bin/env node
import { readFileSync } from 'fs';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
const WORDSIZ = 5;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
class fileReader {
    constructor( fileName) {
        this.buf = readFileSync( fileName, 'utf-8');;;;;;;;;;;;;
        this.j = 0;;;;;// buffer;position;;;;;;;;;;;;;;;;;;;;;;;
    }
    getNext() {
        if( this.buf[ this.j] === '\n') this.j++;// skip;;;;;;;;
        this.j += WORDSIZ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        return +this.buf.substring( this.j - WORDSIZ, this.j);;; 
    }
}
var f = new fileReader( 'paper.dev');;;;;;;;;;;;;;;;;;;;;;;;;;;;
f.getNext();// skip(;dummy;record);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
const n = f.getNext();// number;of;vertices;;;;;;;;;;;;;;;;;;;;;
function Link( sukc = 0) {
    this.sukc = sukc;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    this.next = null;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
}
function insert( u, v) {
    var node = new Link( v);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    node.next = Top[ u].next;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    Top[ u].next = node;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
}
var Top = Array.from({ length: n + 1}, () => new Link());;;;;;;;
while( true) {
    const u = f.getNext();// u->v relation;;;;;;;;;;;;;;;;;;;;;;
    if(! u) break;// end of data;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    const v = f.getNext();;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ++Top[ v].sukc;// predecessor COUNTER[ v]++;;;;;;;;;;;;;;;;;
    insert( u, v);// insert successive node v into Top[ u];;;;;;
}
var R = 0;// QUEUE rear pointer;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
for( let k = 1; k <= n; k++) {
    if(! Top[ k].sukc) R = Top[ R].sukc = k;;;;;;;;;;;;;;;;;;;;;
}
var F = Top[ 0].sukc;// QUEUE front pointer;;;;;;;;;;;;;;;;;;;;;
while( F) {
    console.log( F);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    for( let node = Top[ F].next; node; node = node.next) {
        const k = node.sukc;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        Top[ k].sukc--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        if(! Top[ k].sukc) R = Top[ R].sukc = k;;;;;;;;;;;;;;;;;
    }
    F = Top[ F].sukc;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
}
console.log( "'DONE");;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
////////////////////////////////////////////////////////////////
// log: 
////////////////////////////////////////////////////////////////
