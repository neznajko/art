////////////////////////////////////////////////////////
import java.util.Arrays;

class Cycle
{
    static String buf;
    static char[] tag;
    static char[] f; // formula
    static int n;
    static StringBuilder oput;
    static void spit()
    {
        System.out.println( f);
        System.out.println( tag);
        if( 0 < oput.length()) {
            System.out.println( oput.toString());
        }
    }
    static public void main( String[] args)
    {
        System.out.println( "Cycle");
        // init [ 0]
        buf = "(acfg)(bcd)(aed)(fade)(bgfae)";
        n = buf.length();
        tag = new char[ n + 1]; // + guard
        Arrays.fill( tag, '-');
        f = new char[ n];
        for( int j = 0; j < n; ++j) {
            f[ j] = buf.charAt( j);
        }
        oput = new StringBuilder();
        spit();
        // tag f [ 1]
        char copy = '?';
        for( int j = 0; j < n; ++j) {
            if( f[ j] == '(') {
                tag[ j] = '+';
                copy = f[ j + 1];
                
            } else if( f[ j] == ')') {
                tag[ j] = '+';
                f[ j] = copy;
            }
        }
        spit();
        // yea yea wet's gou!
        int j = 0; // [start]
        while( true) {
            // find first un-tagged( quick seq srch)
            for( ++j; tag[ j] == '+'; ++j);
            if( j == n) break; // DONE
            tag[ j] = '+';
            oput.append( '(');
            oput.append( f[ j]);
            spit();
            // legent:
            // j [ start      ]
            // k [ current    ]
            // i [ srch index ]
            // j < k < i < n
            // What was the algorithm?
            int k = j + 1;
            while( true) { // this not going to win..
                for( int i = j + 2; i < n; i++) {
                    if( f[ i] == f[ k]) {
                        tag[ i] = '+';
                        k = ++i;
                    } // ..design award!
                }
                if( f[ k] == f[ j]) {
                    oput.append( ')');
                    spit();
                    break;
                } else {
                    oput.append( f[ k]);
                }
            }
        }
    }
}
////////////////////////////////////////////////////////
// log: - 3amo HsMa Harpaga gega7?
