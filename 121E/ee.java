////////////////////////////////////////////////////////////////
import static java.lang.System.out;
////////////////////////////////////////////////////////////////
class ExtdEuclid {
    // a m + b n = d
    // a1m + b1n = c
    public static void main( String args[]) {
        int m = 2166;
        int n = 6099;
        // E1.[Initialize.]
        // Set a1 <- b <- 1, a <- b1 <- 0, c <- m, d <- n.
        int c  = m;
        int d  = n;
        int a  = 0;
        int b  = 1;
        int a1 = 1;
        int b1 = 0;
        ////////////////////////////////////////////////////////
        while( true ){
            // E2.[Divide.] Let q and r be the quotient and
            // remainder, respectively, of c divided by d. (We
            // have c = dq + r and 0 <= r < d.)
            int q = c/d;
            int r = c%d;
            // E3.[Remainder zero?] If r = 0, the algorithm
            // terminates; we have in this case am + bn = d as
            // desired.
            if( r == 0 )break;
            // E4.[Recycle.] Set c <- d, d <- r, t <- a1,
            // a1 <- a, a <- t - qa, t <- b1, b1 <- b,
            // b <- t - qb, and go back to E2.
            c = d;
            d = r;
            int t = a1;
            a1 = a;
            a = t - q*a;
            t = b1;
            b1 = b;
            b = t - q*b;
        }
        out.println( "a = " + a );
        out.println( "b = " + b );
        out.println( "d = " + d );
    }
}
//////////////////////////////////////////////////////////////// ______
// log: - Do you know why, so many males, are talking about some ______
// transgender problem!? Because they feel good by observing the ______
// difference of their masculinity compared next to transgenders ------
// and women. There is no difference of that, and the joy of com paring
// your mental superiority over idiots. And it's amazing that th is____
// rhetoric is encouraged politically, although even children kn ow----
// that this is no good.                                         ______
