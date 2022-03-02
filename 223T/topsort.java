                              ////
////////////////////////////////////////////////////////////////
import java.io.*;
import java.util.Arrays;
////////////////////////////////////////////////////////////////
class Link {
    int node;
    Link next;
    Link( int node, Link next) {
        this.node = node;
        this.next = next;
    }
    // insert new Link
    void insert_coin( int u) {
        Link link = new Link( u, this.next);
        this.next = link;
    }
}
////////////////////////////////////////////////////////////////
class Topsort {
    static final int BUFSIZE = 1024;
    static final int WORDLEN = 5;
    static char[] _buf = new char[ BUFSIZE];
    static int _j = 0; // _buf position
    static Link[] _top;
    //
    static int getNextInput() {
        if( _buf[ _j] == '\n') _j++;
        _j += WORDLEN;
        char[] copy = Arrays.copyOfRange( _buf, _j - WORDLEN, _j);
        String s = new String( copy).replaceAll( "\\s+", "");
        return Integer.parseInt( s);
    }
    //
    static void dmp() {
        for( int j = 0; j < _top.length; j++) {
            String s = j + " " + _top[ j].node + ":";
            Link p = _top[ j].next;
            while( p != null) {
                s += " " + p.node;
                p = p.next;
            }
            System.out.println( s);
        }
    }
    //
    public static void main( String[] args) throws IOException {
        System.out.println( "Topsort");
        InputStream file = new FileInputStream( "paper.dev");
        InputStreamReader reader = new InputStreamReader( file);
        BufferedReader bufReader = new BufferedReader( reader);
        bufReader.read( _buf);
        getNextInput();
        int n = getNextInput();
        _top = new Link[ n + 1];
        for( int j = 0; j <= n; j++) {
            _top[ j] = new Link( 0, null);
        }
        while( true) { // u -> v
            int u = getNextInput();
            int v = getNextInput();
            if( u == v) break;
            _top[ v].node++;
            _top[ u].insert_coin( v);
        }
        int R = 0; // fill queue
        for( int j = 1; j <= n; j++) {
            if( _top[ j].node == 0) {
                R = _top[ R].node = j;
            }
        }
        int F = 0; // start popping
        while( true) {
            int node = _top[ F].node;
            if( node == 0) break;
            System.out.println( node);
            Link p = _top[ node].next;
            while( p != null) {
                if( --_top[ p.node].node == 0) {
                    R = _top[ R].node = p.node;
                }
                p = p.next;
            }
            F = _top[ F].node;
        }
        dmp();
    }
}
/////////////////////////////////// https://youtu.be/jhdFe3evXpk
// log: -If you ask me NATO should help Ukraine.
////////////////////////////////////////////////////////////////
