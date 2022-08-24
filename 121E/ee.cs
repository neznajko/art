////////////////////////////////////////////////////////////////
class Extd_Euclid
{
    int m;
    int n;
    int a;
    int b;
    int a1;
    int b1;
    int c;
    int d;
    public Extd_Euclid( int m, int n )
    {
        this.m = m;
        this.n = n;
        a1 = b = 1;
        b1 = a = 0;
        c = m;
        d = n;
    }
    public void go()
    {
        while( true )
        {
            int q = c / d;
            int r = c % d;
            if ( r == 0 ) break;
            c = d;
            d = r;
            int t = a1;
            a1 = a;
            a = t - q * a;
            t = b1;
            b1 = b;
            b = t - q * b;
        }
        Console.WriteLine( a + "*" + m + "+ " + b + "*" + n + 
            "=" + d );
    }
}
class Program
{
    static void Main( string[] args )
    {
        Extd_Euclid ee = new Extd_Euclid( 2166, 6099 );
        ee.go();
    }
}
////////////////////////////////////////////////////////////////
// log: -I've learned that D.Knuth has passed away, don't know
// what to say, and I'm not the right person to give a speech.
// My mom was a programmer and I really like that old school
// programming stuff. I'm not promising to read all his books,
// but I'll try.
