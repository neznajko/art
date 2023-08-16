////////////////////////////////////////////////////////////////
// Invert Permutation k -> X[k] in place, the algoritm is due to
// some Chinese as far as I can remeber!
///////////////////////////////////////////////////////////////=
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
package main
///////////////////////////////////////////////////////////////_
       //           0          //           1          //      
       //  m:                * //  m:                * //
       //  j: -                //  j: -                //
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 //
       //     4  5  2  6  3  1 //     4  5  2  6  3    //
       //  i:                  //  i:                1 //
///////////////////////////////////////////////////////////////=
       //           2          //           3          //      
       //  m:                * //  m:                * //
       // -j: -                // -j:                - //
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 //
       //     4  5  2  6  3 -1 //     4  5  2  6  3 -1 //
       //  i:                1 //  i:                1 //
///////////////////////////////////////////////////////////////>
       //           4          //           5          //      
       //  m: *                //  m: *                //
       // -j:                - // -j:                - //
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 //
       //     4  5  2  6  3 -1 //        5  2  6  3 -1 //
       //  i:                1 //  i: 4                //
////////////////////////////////////////////////////////////////
       //           6          //           7          //      
       //  m: *                //  m: *                //
       // -j:                - // -j: -                //
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 //
       //    -6  5  2  6  3 -1 //    -6  5  2  6  3 -1 //
       //  i: 4                //  i: 4                //
////////////////////////////////////////////////////////////////
       //           8          //           9          //      
       //  m:          *       //  m:          *       //
       // -j: -                // -j: -                //
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 //
       //    -6  5  2  6  3 -1 //    -6  5  2     3 -1 //
       //  i: 4                //  i:          6       //
////////////////////////////////////////////////////////////////
       //          10          //          11          //      
       //  m:          *       //  m:          *       //
       // -j: -                // -j:          -       //
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 //
       //    -6  5  2 -1  3 -1 //    -6  5  2 -1  3 -1 //
       //  i:          6       //  i:          6       //
////////////////////////////////////////////////////////////////
       //          12          //          13          //      
       //  m:                * //  m:                * //
       // -j:          -       // -j:          -       //
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 //
       //    -6  5  2 -1  3 -1 //    -6  5  2 -1  3    //
       //  i:          6       //  i:               -1 //
////////////////////////////////////////////////////////////////
       //          14          //          15          // a n d      
       //  m:                * //  m:                * // s o
       // -j:          -       // -j:          -       // f o r
       //     1  2  3  4  5  6 //     1  2  3  4  5  6 // t h
       //    -6  5  2 -1  3 -1 //    -6  5  2 -1  3  4 //
       //  i:         -4       //  i:         -4       //
////////////////////////////////////////////////////////////////
// Basically the idea is that if ve haav some pertmutation
// 1 2 3 4 ,that is 1 -> 4, 2 -> 1, 3 -> 3, 4 -> 2, the inverse
// 4 1 3 2  is fliping the directions 4 -> 1, 1 -> 2, etc.
// so if ve haav 1 -> 4 -> 2 we replace in place 2 with 1, and
// at the same time keeping 2 into variable in this case i, the
// minus sign is used for tagging.
import "fmt"
/////////////////////////////////^//////////////////////////////
// actors: m j i X[1..n]         :        
// [ I1. initialize ]            :          
// m <- n, j <- -1               :        +------+
// [ I2. Get Next ]              :        | Init |
// i <- X[m], if i < 0 go to I5. :        +------+---+<--------+
//                               :        | Get Next |         |
// [ I3. FlipOne ]               :        +----------+-------+ |
// X[m] <- j,                    : +----->| Flip One |       | |
// j <- -m,                      : |      +------+---+       | |
// m <- i,                       _ |      | Loop |           | |
// i <- X[m]                     _ +------+------++          | |
// [ I4. Loop ]                  ,        | Store |<---------+ |
// if i > 0 repeat I3, otherwise _        +-------+---+        |
// i <- j                        .        | haHa haHa |        |
// [ I5. Store ]                 ,        +-----------+--------+
// X[m] <- -i                    /
// [ I6. haHa haHa ]             _
// m-- if dzero gerout           .
/////////////////////////////////_//////////////////////////////
/////////////////////////////////_//////////////////////////////
/////////////////////////////////>//////////////////////////////
func main(){
    fmt.Println( "inverse" )
    X := []int{ 0, 4, 5, 2, 6, 3, 1 }
    j := -1
    i := 0
    fmt.Println( X )
    for m := len( X ) - 1; m > 0; m-- {
        i = X[m] // m -> X[m]
        if i > 0 {
            for {
                X[m] = j // we must have had -j -> m, so this is
                         // inverting to m -> j, and tagging 
                j = -m
                m = i
                i = X[m]
                if i < 0 {
                    i = j
                    break
                }
            }
        }
        X[m] = -i
    }
    fmt.Println( X )
}
///////////////////////////////////////////////////////////////>
///////////////////////////////////////////////////////////////*
///////////////////////////////////////////////////////////////=
///////////////////////////////////////////////////////////////_
// log: If hierarchy was the structure of life as opposite to
// chaos with your beloved God sitting on top, how would you 
// explain the chaos with that well ordered structure? It still
// exists ryte so it must be subject to the all mighty tree
// stuff, I guess?
// I'm just thinking that apart of the humiliation joy you experience
// by calling me rabbit, probably this is your native way to prove 
// my theory is wrong, becoz the other possibility is that I'm 
// quoting someone, but becoz you can't tell who I'm quoting,
// coz I'm quoting no one this is your best bet; the tree
// structure, we are in the army and I'm a rabbit, ryte?
// When I've said that the structure of life is fractal and not
// hierarchical I mean that we have the same stuff regardless of
// the scale. Now as a programmer I can admit the there is a
// such feature it the tree structure becoz every sub-tree is
// a tree, that is every master is a rabbit of its master in
// your language, but that is not the only way we can build
// systems, for example the definition of program is that we
// have input algorithm output, so we can chain the output of 
// one program to the input of another and build a system that
// way. So it doesn't matter if we have parent child relations
// or input output algorithms or whatever the im-B-ortant thing
// is that systems and sub-systems are same stuff.
////////////////////////////////////////////////////////////////
