////////////////////////////////////////////////////////////////////////
public class Euclid
{
    public static void main (String[] args) {
        int m = (0 < args.length)? Integer.parseInt (args[ 0]): 4340;
        int n = (1 < args.length)? Integer.parseInt (args[ 1]): 465;
        String s = String.format ("GCD(%d,%d)=", m, n);
        //
        while (true) {
            int r = m % n;
            if (r == 0) break;
            m = n;
            n = r;
        }
        s += n;
        System.out.println (s);
    }
}
////////////////////////////////////////////////////////////////////////
// log:
