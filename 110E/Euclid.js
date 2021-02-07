#! /usr/bin/env node
function gcd (x, y) {
    if (x < y) {
        [x, y] = [y, x];
    }
    while (true) {
        let r = x % y;
        if (r == 0) break;
        x = y;
        y = r;
    }
    return y;
}
var args = process.argv.slice(2);
var m = (0 < args.length)? parseInt(args[0]): 2166;
var n = (1 < args.length)? parseInt(args[1]): 6099;
console.log(`GCD(${m},${n})=` + gcd(m, n));
// log:
