////////////////////////////////////////////////////////////////
package main
import "fmt"
////////////////////////////////////////////////////////////////
func main() {
    f1 := "(acfg)(bcd)(aed)(fade)(bgfae)"
    const n int = 'g' - 'a' + 1
    var T[n + 1] int
    for k := 1; k <= n; k++ {
        T[k] = k
    }
    j := 0
    z := j
    for k := len( f1) - 1; k >= 0; k-- {
        c := f1[k]
        if c == ')' {
            z = 0
        } else if c == '(' {
            T[j] = z
        } else {
            i := int( c - 'a' + 1)
            T[i], z = z, T[i]
            if T[i] == 0 {
                j = i
            }
        }
    }
    fmt.Println( T)
}
////////////////////////////////////////////////////////////////
// log: -Things are not so simplistic, it is not Black and White
// binary.. simplistic stuff, The World is more complex!..
// -That's the obvious isn't it, what appears on the surface,
// but deep down the things are, OK not simplistic, but simple,
// Black and White and binary. The computer games can create
// million different complex worlds but the CPU can understand
// instructions consisting of only zeroes and ones. This duality
// was falsely understood in the Western Civilization as good vs
// bad. Last time I've checked the Wikipedia for the meaning of
// the S Korean flag to answer P Pong, it was historically
// explained as some opposite cosmic forces, now it is changed.
// This understanding is due to Chinese Taoism or Dao or
// whatever philosophy they have and it's also not true. There
// are no opposite forces, being they cosmic. I mean there might
// be but not in this World. Keep you symbols the truth doesn't
// depend on some symbols, I don't need them. Black and White
// or Pink and Green or Plus and Minus or what ever, but not as
// tradition states good vs bad, Putin vs Nazi, beauty vs ugly,
// represent let's say the contrasts, and the world or the whole
// is stable only as a harmony between contrasts, this harmony
// is the force, and this is the good, cos otherwise the whole
// will fall apart, if you want to build a stable world from
// the cosmic anti force you need anti particles, because the
// harmony between equal thing will fail as the anti force
// between particles it's not very difficult to understand and
// this is the last time I'm talking about that stuff.
//
