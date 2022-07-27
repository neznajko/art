////////////////////////////////////////////////////////////////
package main
////////////////////////////////////////////////////////////////
import "fmt"
////////////////////////////////////////////////////////////////
func main() {
    m:= 2166 // Am + Bn = c
    n:= 6099 // am + bn = d
    A:= 1
    B:= 0
    a:= 0
    b:= 1
    c:= m
    d:= n
    for true {
        q:= c/d
        r:= c%d
        if r == 0 { break }
        // The reduction formula:
        //        am +        bn = d
        // (A - aq)m + (B - bq)n = r
        t:= A
        A = a
        a = t - a*q
        t = B
        B = b
        b = t - b*q
        c = d
        d = r
    }
    fmt.Printf( "%d*%d + %d*%d = %d\n", a, m, b, n, d )
}
////////////////////////////////////////////////////////////////
// log: -Don't remember very much details, but this algorithm, t ħǡť.
// is the extended Euclid algorithm is important in number theor ŷ...
// and cryptography, cos it gives the formula for the inverse mo ɖʉǁò
// of a number which is used for example in the RSA cryptosystem ....
