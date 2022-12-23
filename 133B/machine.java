////////////////////////////////////////////////////////////////
//     ( a c f g ) ( b c d ) ( a e d ) ( f a d e ) ( b g f a e )
//a -> d d a a a a a a a a a a a d d d d d d e e e e e e e e a a
//b -> c c c c c c c c g g g g g g g g g g g g g g g g b b b b b
//c -> e e e d d d d d d c c c c c c c c c c c c c c c c c c c c
//d -> g g g g g g g ) ) ) d d ) ) ) b b b b b d d d d d d d d d
//e -> b b b b b b b b b b b b b b a a a ) ) ) ) b b ) ) ) ) ) e
//f -> f f f f e e e e e e e e e e e e e e a a a a a a a a f f f
//g -> a ) ) ) ) f f f f f f f f f f f f f f f f f f f f g g g g
////////////////////////////////////////////////////////////////
import static java.lang.System.out;
import java.util.Arrays; // Arrays.toString
////////////////////////////////////////////////////////////////
class Machine {
    private String f1;
    private int    n;
    private int[]  T;
    private int    k; // f1 back iterator
    private int    Z;
    private int    j; 
    //
    private int off( char ascii ){
        return ascii - 'a' + 1;
    }
    private int fstpas() {
        int maxoff = -1;
        for( int j = 0, n = f1.length(); j < n; ++j ){
            maxoff = Math.max( maxoff, off( f1.charAt( j )));
        }
        return maxoff;
    }
    ////////////////////////////////////////////////////////////
    // B1. [Initialize] Set T[k] <- k, for 1 <= k <= n. Prepare
    // to scan the input from right to left.
    private void B1() {
        for( int i = 1; i <= n; ++i ) T[i] = i;
        k = f1.length();
        B2();
    }
    ////////////////////////////////////////////////////////////
    // B2. [Next element] Get next element, if input is exhausted,
    // terminate the algorithm. If the character is ), set Z <- 0,
    // and repeat B2, if it is ( go to B4, otherwise it is X[i] for
    // some i. Move to B3.
    private void B2() {
        if( --k < 0 ) throw new RuntimeException();
        switch( f1.charAt( k )){
            case ')': Z = 0; B2();
            case '(':        B4();
            default:         B3();                
        }
    }
    ////////////////////////////////////////////////////////////
    // B3. [Change T[i]] Exchange T[i] and Z, if this makes T[i]
    // zero, set j <- i. Go to B2.
    private void B3() {
        int i = off( f1.charAt( k ));
        int t = T[i]; T[i] = Z; Z = t;
        if( T[i] == 0 ) j = i;
        B2();
    }
    ////////////////////////////////////////////////////////////
    // B4. [Change T[j]] Set T[j] <- Z. Go to B2.
    private void B4() {
        T[j] = Z;
        B2();
    }
    //
    public Machine( String f1 ){
        this.f1 = f1;
        n = fstpas();
        T = new int[ n + 1 ];
    }
    public void go() {
        try {
            B1();
        } catch( RuntimeException e ){
            out.println( Arrays.toString( T ));
        }
    }
    static public void main( String[] args ){
        out.println( "Machine java" );
        String f1 = "(acfg)(bcd)(aed)(fade)(bgfae)";
        ( new Machine( f1 )).go();
    }
}
////////////////////////////////////////////////////////////////
// Machine java
// [0, 4, 3, 5, 7, 2, 6, 1]
////////////////////////////////////////////////////////////////
//
//
