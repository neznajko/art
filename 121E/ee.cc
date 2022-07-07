////////////////////////////////////////////////////////////////
// As we know from the Euclid Algorithm the greatst commn divisr
// of two numbrs m and n is:
//
//   d = gcd( m, n ) = gcd( n, m mod n )                     (1)
//
// This reductn gives us a naturl way to exprss the problm using
// recursiv fnctions. Let's try to apply it on the extendd versn.
// Here we want to find two additionl numbrs, a and b, such that:
//
//   am + bn = d = gcd( m, n ),                              (2)
//
// becuse of formula (1), we can also write:
//
//   An + B( m mod n ) = d = gcd( n, m mod n ).              (3)
//
// To find the new constants A, B, we can use the famous formula
// of Number Theory:
//
//   m = [floor(m/n)]n + (m mod n),                          (4)
//
// and the equality of formulas (2) and (3):
//
//   am + bn = An + B(m - [floor(m/n)]n) =
//           = Bm + {A - B[floor(m/n)]}n, thus we get:
//
//   a = B, and                                              (5)
//   b = A - B[floor(m/n)]                                   (6)
//
// Knuth algorithms have this drawbck that it's not very visible
// why the stuff is working. They are writtn such because of the
// mathematicl anlyss of their running tims which addrsss dtails
// which practiclly most of the programmrs don't care about (and
// don't understand), like not only what is the avrage time as a
// fnction of the nput siz, but wat is the sigma of its dstribtn,
// etc.
////////////////////////////////////////////////////////////////
struct triplet {
    int a;
    int b;
    int d;
};
////////////////////////////////////////////////////////////////
triplet euclid_plus( int m, int n ){
    if( n == 0 ) return { 1, 0, m };
    auto y = euclid_plus( n, m % n );
    return { y.b, y.a - (y.b * (m / n)), y.d };
}
////////////////////////////////////////////////////////////////
# include <cstdio>
////////////////////////////////////////////////////////////////
int main() {
    int m = 2166;
    int n = 6099;
    auto y = euclid_plus( m, n );
    printf( "%d(%d) + %d(%d) = %d\n", m, y.a, n, y.b, y.d );
}
////////////////////////////////////////////////////////////////
    
