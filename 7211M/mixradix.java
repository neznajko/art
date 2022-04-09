////////////////////////////////////////////////////////////////////////
import java.util.Arrays;
////////////////////////////////////////////////////////////////////////
class MixDix { // Mixed Radix Tuple Generator
    int[] tupl_; // the tuple
    int[] base_; // Wikipedia: In a positional numeral system, the radix
    // or base is the number of unique digits, including the digit zero,
    // used to represent numbers.
    MixDix( int[] base ){
        base_ = base; // reference
        tupl_ = new int[ base.length ]; // ready to go( full of nulls )
    }
    void chck() {
        System.out.println( Arrays.toString( tupl_ ));
    }
    void all() {
        while( true ){
            chck();
            int j = carry(); 
            if( j < 0 ) break;
            tupl_[ j ]++;
        }
    }
    int carry() {
        int j = base_.length - 1;
        while( j > -1 && tupl_[ j ] == base_[ j ] - 1 ){
            tupl_[ j-- ] = 0;
        }
        return j;
    }
    static public void main( String[] args ){
        MixDix md = new MixDix( new int[]{ 3, 4, 2 });
        md.all();
    }
}
////////////////////////////////////////////////////////////////////////
