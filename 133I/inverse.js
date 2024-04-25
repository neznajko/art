////////////////////////////////////////////////////////////////
console.log( "invert permutation in place" );
//////////////////////////////////////////////////////////////// シ
//                0  1  2  3  4  5  6                    i: vero ン
invert_in_place([ 0, 5, 6, 1, 4, 3, 2 ]);                        
//////////////////////////////////////////////////////////////// 
// | 1 2 3 4 5 6 | 1->5->3->1                  g: stimmt( wahr )
// | 5 6 1 4 3 2 | 2-->6--->2
//                 4------->4
//////////////////////////////////////////////////////////////// 真
function invert_in_place( X ){ //                      u: правда
    let prev = 0                   
    let curr = X.length - 1
////////////////////////////////////////////////////////////////
    function invert_cycle() { //                         f: vrai
        while( true ){
            let next = X[ curr ];
            X[ curr ] = -prev;
            if( next == 0 ){
                prev = 0;
                return;
            }
            prev = curr;
            curr = next;
        }
    }
    dunf( X );
////////////////////////////////////////////////////////////////
    while( curr > 0 ){ //                           s: verdadero
        if( X[ curr ] < 0 ){
            X[ curr ] = -X[ curr ];
            curr -= 1;
        } else {
            invert_cycle();
        }
    }
    dunf( X );
}
////////////////////////////////////////////////////////////////
function dunf( X ){
    console.log([ ...Array( X.length ).keys() ]);
    console.log( X );
}
////////////////////////////////////////////////////////////////
//                                                       e: true
