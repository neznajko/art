////////////////////////////////////////////////////////////////
package main
import (
    "fmt"
    "io/ioutil"
    "strconv"
    "strings"
    "os"
)
////////////////////////////////////////////////////////////////
func main() {
    fmt.Println( "Topological Sorting")
    bufr, errr := ioutil.ReadFile( "paper.dev")
    if errr != nil {
        fmt.Println( errr)
        return
    }
    const WSIZE int = 5 // Word size
    j := 0 // input buffer pointer
    getnext := func() int { // get next input number
        if bufr[ j] == '\n' { // handle newlines
            j++
        }
        k := j + WSIZE // end position of the current word
        s := strings.TrimSpace( string( bufr[ j:k]))
        n, err := strconv.Atoi( s)
        if err != nil { // this is too modern
            fmt.Println( err)
            os.Exit( -1)
        }
        j = k // update j to next word
        return n
    }
    // Build top data structure
    getnext()
    n := getnext() // number of vertices
    top := make( []Node, n + 1)
    for true {
        // u -> v
        u := getnext()
        v := getnext()
        if u == v {
            break // end of transaction
        }
        top[ v].succ++
        insert_coin( top, u, v)
    }
    // Data structure is bld. Now do the actual sorting;
    // 1. fill the queue, Loop over all vertices, and chck 
    // vhether COUNT is 0, that is there are no preds etc..
    R := 0 // rear baby
    for v := 1; v <= n; v++ {
        if top[ v].succ == 0 {
            top[ R].succ = v // pushing to queue
            R = v
        }
    }
    // 2. Start popiing
    F := 0 // front baby
    const real bool = true
    s := "O-o-o-da-a: "
    for real {
        v := top[ F].succ
        if v == 0 {
            break
        }
        for p := top[ v].next; p != nil; p = p.next {
            u := p.succ
            top[ u].succ--
            if top[ u].succ == 0 {
                top[ R].succ = u
                R = u
            }
        }
        s += strconv.Itoa( v) + " "
        F = v
    }
    fmt.Println( s)
}
////////////////////////////////////////////////////////////////
type Node struct {
    succ int
    next *Node
}
func dmp( top []Node) {
    for j := 0; j < len( top); j++ {
        s := fmt.Sprintf( "%d: %d => ", j, top[ j].succ)
        for p := top[ j].next; p != nil; p = p.next {
            s += strconv.Itoa( p.succ) + " "
        }
        fmt.Println( s)
    }
}
func insert_coin( top []Node, u int, v int) {
    node := Node{ succ: v, next: top[ u].next}
    top[ u].next = &node
}
////////////////////////////////////////////////////////////////
// log:
////////////////////////////////////////////////////////////////
