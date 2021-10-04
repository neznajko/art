////////////////////////////////////////////////////////////////
package main
import "fmt"
////////////////////////////////////////////////////////////////
func fst_pas( f1 []byte, tag []byte) {
    var backup byte
    for j, v := range f1 {
        if v == '(' {
            backup = f1[ j + 1]
            tag[ j] = 'v'
        } else if v == ')' {
            f1[ j] = backup
            tag[ j] = 'v'
        }
    }
}
////////////////////////////////////////////////////////////////
func dmp( s []byte) {
    fmt.Println( string( s))
}
func next_start( tag []byte, last int) int {
    for last++; tag[ last] == 'v'; last++ {}
    return last
}
func scan( f1 []byte, tag []byte, j int) {
    // [ 0] check this out
    n := len( f1) - 1
    // [ 1] make it happen
    for {
    // [ 2] what is this?
        for ; f1[ j] != f1[ n]; j++ {}
    // [ 3] end of formula?
        if j == n { return }
    // [ 4] tag
        tag[ j] = 'v'
    // [ 5] set new key
        f1[ n] = f1[ j + 1]
    // [ 6] advance
        j += 2
    }
}
////////////////////////////////////////////////////////////////
func cycle( f1 []byte, tag []byte, start int) []byte {
    // [ 1] dmp opening parenthesis
    out := []byte{ '('};
    // [ 2] tag the start
    tag[ start] = 'v'
    // [ 3] dmp f1@start
    out = append( out, f1[ start])
    // [ 4] copy search key to guardian
    n := len( f1) - 1
    f1[ n] = f1[ start + 1]
    // [ 5] loop until not closed
    for {
    // [ 6] scan f1
        scan( f1, tag, start + 2)
    // [ 7] check if done
        if f1[ n] == f1[ start] {
            break
        }
    // [ 8] dmp to output buffer
        out = append( out, f1[ n])
    }
    // [ 9] put closing parenthesis
    out = append( out, ')')
    // [ a] ger out
    return out
}
////////////////////////////////////////////////////////////////
func main() {
    f1  := []byte( "(acfg)(bcd)(aed)(fade)(bgfae)=")
    tag := []byte( "------------------------------")
    n := len( f1) - 1 // guardian position
    fst_pas( f1, tag)
    for start := 1; start < n; start = next_start( tag, start) {
        fmt.Print( string( cycle( f1, tag, start)))
    }
    fmt.Println()
}
////////////////////////////////////////////////////////////////
// log: https://youtu.be/_wu1V30YLro
