////////////////////////////////////////////////////////////////
import java.util.*;
////////////////////////////////////////////////////////////////
class CC {
    public static void main( String[] args ){
        //              play toto 2 6 / 49
        int[] K = { -1, 12, 18, 21, 49, 15, 8 };
        int N = K.length - 1;
        int[] count = new int[ N + 1 ];
        for( int i = N; i > 1; --i ){
            for( int j = i - 1; j > 0; --j ){
                if( K[ i ] < K[ j ]){
                    ++count[ j ];
                } else {
                    ++count[ i ];
                }
            }
        }
        System.out.println( Arrays.toString( K ));
        System.out.println( Arrays.toString( count ));
    }
}
////////////////////////////////////////////////////////////////
// My reputation has collapsed like a wave function long before
// my previous post, and probably it was not a good idea to talk
// unprepared on such topics, but somehow I don't understand
// what is the problem becoz if there is no detector the
// probability that the electron passes from the left side is
// 1/2 and the probability that it passes from the ryte side is
// 1/2 as well, but in the presence of a detector we have
// conditional probabilities, I mean what is the probability
// that the electron is on the ryte given that detector on the
// left has activated the lasers, 4 me obviously zero, anyway
// apologies if I hurt someone feelings
