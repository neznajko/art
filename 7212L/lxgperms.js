#!/usr/bin/env node

var a = [0, 1, 2, 2, 4];

function swap( i, j ){
  /** boom */
  [a[i], a[j]] = [a[j], a[i]];
}
function next( a ){
  /** bam! */
  var n = a.length - 1; // back
  // [ find j ]
  var j = n - 1;
  for( ; a[j] >= a[j + 1]; --j )
    ;
  if( j == 0 ) return false;
  // [ increace a[j] ]
  var r = n;
  for( ; a[j] >= a[r]; --r )
    ;
  swap( j, r );
  // [ reverse ]
  for( r = n, ++j; j < r; ++j, --r ){
    swap( j, r );
  }
  return true;
}
do {
  console.log( a.slice( 1 ));
} while( next( a ));

// log:
