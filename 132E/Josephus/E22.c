#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
////////////////////////////////////////////////////////////////
typedef struct node {                                 /* node */
  int n;
  int prev;
  int next;
} node_t;
////////////////////////////////////////////////////////////////
node_t *cons( int n)                                  /* cons */
{
  node_t *circ = ( node_t *) malloc( n* sizeof( node_t));

  for( int j = 0; j < n; ++j) {
    int k = ( j + 1)% n;
    circ[ j].next = k;
    circ[ k].prev = j; 
  }
  return circ;
}
////////////////////////////////////////////////////////////////
node_t *Josephus( int n, int m)                   /* Josephus */
{
  node_t *circ = cons( n);
  int p = 0; // circ position
  int q = 1; // execution order

  for( ;;) {
    int cntr = m; // next victim counter
    while( --cntr) p = circ[ p].next;
    circ[ p].n = q++;
    if( n == q) break;
    // remoo( unlink) 
    circ[ circ[ p].prev].next = circ[ p].next;
    circ[ circ[ p].next].prev = circ[ p].prev;
    // start counting from live player
    p = circ[ p].next;
  }
  circ[ circ[ p].next].n = q;
  return circ;
}
////////////////////////////////////////////////////////////////
void dunf( node_t *circ, int n)                       /* dunf */
{
  char *s = "";

  for( int j = 0; j < n; ++j) {
    asprintf( &s, "%s%d", s, circ[ j].n);
  }
  puts( s);
}
////////////////////////////////////////////////////////////////
int main( void)                                       /* main */
{
  int n; // n players
  int m; // mth

  scanf( "%d %d", &n, &m); // echo 8 4 | ./a.out

  node_t *circ = Josephus( n, m);

  dunf( circ, n);
  free( circ); // clean the mess
}
////////////////////////////////////////////////////////////////
/*                                                          log:
 *                                                 8 4: 54613872                                   
 *                             next and prev indexing looks ugly
 */
