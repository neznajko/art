#!/usr/bin/env node
function spit(prime, linez) {
  console.log("Table of first 500 primes:");
  for (let i = 0; i < linez; ++i) {
    let s = "";
    for (let j = i; j < prime.length; j += linez) {
      s += " " + ("000" + prime[j]).slice(-4); 
    }
    console.log(s);
  }
}
/* n - next prime candidate *
 * p - list of found primes */
function isPrime(n, p) {
  for (let k = 1;; ++k) {
    if (n%p[k] == 0   ) return false;
    if (n/p[k] <= p[k]) return true ; // thats
  }
}
function primes() {
  let prime = [2,3];
  for (let n = 5; prime.length < 500; n += 2) {
    if (isPrime(n, prime)) {
      prime.push(n);
    }
  }
  spit(prime, 50);
}
primes();
