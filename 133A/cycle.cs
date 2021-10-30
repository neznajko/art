                                      ////
////////////////////////////////////////////////////////////////////////////////
using System;
using System.Linq;
////////////////////////////////////////////////////////////////////////////////
namespace cycle
{
    class Program
    {
        static char[] f1; // cycle formula
        static char[] tg; // tag
        static char[] ut; // output
        static int cx;    // scanning index
        static int bx;    // output index
        static int start; // cycle start position
        static int g;     // guardian position
////////////////////////////////////////////////////////////////////////////////
        static void fstpas()
        {           
            for( int j = 0; j < g; ++j) {
                if( f1[ j] == '(') {
                    tg[ j] = 'v';
                    f1[ g] = f1[ j+1];
                } else if( f1[ j] == ')') {
                    tg[ j] = 'v';
                    f1[ j] = f1[ g]; 
                }
            } 
        }
////////////////////////////////////////////////////////////////////////////////
        static void dmp()
        {
            Console.WriteLine( f1);
            Console.WriteLine( tg);
            Console.WriteLine( ut.Take( bx).ToArray());
        }
////////////////////////////////////////////////////////////////////////////////
        static void fst_untag() // that is start
        {
            while( true) {
                start++;
                if( tg[ start] == '-') break;
            }            
        }
        static void scan_f1()
        {
            while( true) {
                while( f1[ cx] != f1[ g]) cx++;
                if( cx == g) break;
                tg[ cx] = 'v';
                // setup key and cx
                f1[ g] = f1[ cx + 1];
                cx += 2;
            }
        }
        static bool cycle()
        {
            fst_untag();
            if( start == g) return false; // ve ar dn!
            tg[ start] = 'v';
            ut[ bx++] = '(';
            ut[ bx++] = f1[ start];
            // setup key and cx
            f1[ g] = f1[ start + 1];
            cx = start + 2;
            while( true) {
                scan_f1();
                if( f1[ g] == f1[ start]) break; // dn
                ut[ bx++] = f1[ g];
                cx = start + 1;        
            }
            ut[ bx++] = ')';
            return true;
        }
////////////////////////////////////////////////////////////////////////////////
        static void Main( string[] args)
        {
            f1 = "(acfg)(bcd)(aed)(fade)(bgfae)=".ToCharArray();
            tg = "------------------------------".ToCharArray();
            ut = "==============================".ToCharArray();
            cx = bx = start = 0;
            g = f1.Length - 1;
            dmp();
            fstpas();
            dmp();
            while( cycle()) {}
            dmp();
        }
    }
}
////////////////////////////////////////////////////////////////////////////////
// log:
////////////////////////////////////////////////////////////////////////////////
    ////                                                                \\\\     