////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
public class CC {
    private int[] key;
    public CC( params int[] key ){
        this.key = key;
    }
    public void cc() {
        int n = key.Length - 1;
        int[] count = new int[ n + 1 ];
        for( int i = n; i > 1; --i ){
            for( int j = i - 1; j > 0; --j ){
                if( key[ i ] < key[ j ]){
                    ++count[ j ];
                } else {
                    ++count[ i ];
                }
            }
        }
        Console.WriteLine( string.Join( ", ", key ));
        Console.WriteLine( string.Join( ", ", count ));
    }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
class Program {
    static void Main() {
        new CC( -1, 12, 18, 21, 49, 15, 8 ).cc();
    }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Recently have heart some people talking t h a t democracy i s
// stupid and all serious a n d wise nations( think China ) rule 
// in top d o w n approach etc. Of course I might b e wrong, but 
// this is what I think; t h e top down structure doesn't matter 
// what matters is what you p u t on the top. When we talk about 
// politics kings queens and s t u f f, there are two approaches:
// 1) God rules; this are dictatorship l i k e countries, I mean 
// Russia now America etc., and m a k e no mistake the people on 
// the top t h i n k they are c h o s e n from God and have some 
// celestial mission 
// 2) The Rule is God; w e can think Democracy has many features 
// OK some of them stupid, but I think the most important one is 
// that it puts the Rule of Law on the top, and this is the path 
// of Europe t o keep Democracy and Human Dignity as its primary 
// virtues
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

