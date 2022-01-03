namespace topsort
{
    public class Node {
        public int value;
        public Node? next; // wtf?
        public Node( int value) {
            this.value = value;
            this.next = null;
        }
    }
    class Program
    {
        static string buf = "";
        static int bufPointer = 0;
        static readonly int MIXWORDLEN = 5;
        static int noVertices = 0; // number of
        static Node[]? top; // Non-nullable warning.
        static int ReadNextVertex() {
            // Chk if bufPointer is over newline.
            if( buf[ bufPointer] == '\n') {
                bufPointer += 1; // skip
            }
            string s = buf.Substring( bufPointer, MIXWORDLEN);
            bufPointer += MIXWORDLEN;
            return Convert.ToInt32( s);
        }
        static string Topstr( int j) {
            if( top == null) return ""; // Dodge nasty warnings
            Node n = top[ j];
            string s = "CUNT: " + n.value + ", SUCC: ";
            for( Node? p = n.next; p != null; p = p.next) { // ??
                s += p.value + " ";
            }
            return s;
        }  
        static void Dmp() {
            Console.WriteLine( "TOP STRUCT");
            for( int j = 0; j <= noVertices; j++) {
                Console.WriteLine( Topstr( j));
            }
        }
        static void Main( string[] args)
        {
            buf = File.ReadAllText( "paper.dev");            
            ReadNextVertex();
            noVertices = ReadNextVertex();
            top = new Node[ noVertices + 1];
            for( int j = 0; j <= noVertices; j++) {
                top[ j] = new Node( 0);
            }
            for( ;;) {
                // u -> v
                int u = ReadNextVertex();
                int v = ReadNextVertex();
                if( v == 0) break; // chk if done
                // increment COUNT
                top[ v].value++;
                // link
                Node suc = new Node( v); // successor
                suc.next = top[ u].next;
                top[ u].next = suc;
            }
            Dmp();
            // Fill the Queue
            int R = 0; // rear
            for( int j = 1; j <= noVertices; j++) {
                if( top[ j].value == 0) {
                    top[ R].value = j;
                    R = j;
                }
            }
            // Let the party start
            int F = 0; // the frontman
            for( ;;) {
                int v = top[ F].value;
                if( v == 0) break; 
                Console.WriteLine( v);
                // Decsuc, decrease successors
                Node? p = top[ v].next;
                while( p != null) {
                    int u = p.value;
                    top[ u].value--;
                    if( top[ u].value == 0) {
                        top[ R].value = u;
                        R = u;
                    }
                    p = p.next;
                }
                F = v;
            }
            // Turn off the lights
        }
    }
}
// log:
