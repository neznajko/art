////////////////////////////////////////////////////////////////
using System;
////////////////////////////////////////////////////////////////
class Program
{
    static int getOffset( char c ){
        return c - '`';
    }
    static int getMaxOffset( string f )
    {
        int maxOffset = 0;
        foreach( char c in f )
        {
            int offset = getOffset( c ); 
            if( offset > maxOffset ){
                maxOffset = offset;
            }
        }
        return maxOffset;
    }
    static void Main( string[] args )
    {
        string f = "(acfg)(bcd)(aed)(fade)(bgfae)";
        Console.WriteLine( "formula: " + f );
        int n = getMaxOffset( f );
        Console.WriteLine( "maxOffset: " + n );
        int[] T = new int[ n + 1 ];
        for( int k = 1; k <= n; ++k ){
            T[ k ] = k;
        }
        int j = 0;
        int Z = 0;
        for( int k = f.Length - 1; k >= 0; --k ){
            char c = f[ k ];
            int  i = getOffset( c );
            if( c == ')' ){
                Z = 0;
            } else if( c == '(' ){
                T[ j ] = Z;
            } else {
                ( T[ i ], Z ) = ( Z, T[ i ]);
                if( T[ i ] == 0 ){
                    j = i;
                }
            }
        }
        Console.WriteLine( "[" + string.Join( ", ", T ) + "]" );
    }
}
////////////////////////////////////////////////////////////////
//
//
