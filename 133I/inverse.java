////////////////////////////////////////////////////////////////
import static java.lang.System.out;
////////////////////////////////////////////////////////////////
import java.util.Arrays;
///////////////////////////////_________________________________
class Inverse {              //.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.
    int m;                   //---------------------------------
    int j;                   //' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '
    int i;                   //````''''````''''````''''````''''`                                 
    int X[];                 //--__--__--__--__--__--__--__--__-
    boolean GetNext(){ // I2 //. . . . . . . . . . . . . . . . . 
	i = X[ m ];          //  =     =     =     =     =     =
	return i > 0;        //"""""""""""""""""""""""""""""""""
    }                        //`````````````````````````````````
    void FlipOne(){ // I3    //
	X[ m ] = j;          //
	j = -m;              //
	m = i;               //_________________________________
	i = X[ m ];          //_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    }                        // _  _  _  _  _  _  _  _  _  _  _
    boolean Cycle(){ // I4   //  _    _    _    _    _    _    _
	if( i > 0 ){         //_________________________________
	    return true;     //. , . , . , . , . , . , . , . , .
	}                    //---------------------------------
	i = j;               //
	return false;        //____________________ tscheck thus
    }                        //
    void Store(){ // I5      //
	X[ m ] = -i;         //. . . . . . . . . . .   . . . . .
    }                        //|||||||||||||||||||||||||||||||||
    boolean Loop(){ // I6    //                     
	if( --m > 0 ){       //                     .
	    return true;     //
	}                    //.................................
	return false;        //
    }                        //
    public Inverse( int X[] ){/////////////////////////////////_
	this.X = X;          //
	// [ I1 ] Initialize.//
	m = X.length - 1;    //
	j = -1;              //
	i = 0;               //
    }                        //
    public void Debug(){     //
	out.println( Arrays.toString( X ));
	out.println( "m: " + m + " j: " + j + " i: " + i );
    }                        //
    public void Algorithm(){ //
	while( true ){       //
	    if( GetNext()){  //
		while( true ){//////////////////////////////////
		    FlipOne();//////////////////////////////////
		    if( !Cycle()){//////////////////////////////
			break;//////////////////////////////////
		    }        //
		}            //
	    }                //
	    Store();         //
	    if( !Loop()){    //
		break;       //
	    }                //
	}                    //
    }                        ///////////////////////////////////
    static public void main( String args[]){
	int X[] = { 0, 4, 1, 3, 2 };
	Inverse inverse = new Inverse( X );
	inverse.Debug();
	inverse.Algorithm();
	inverse.Debug();
    }
}
////////////////////////////////////////////////////////////////
// 1 2 3 4  1 -> 4 -> 2 -> 1 I sink I have some idea why this is
// 4 1 3 2  ?    1    4    2 working beeecoooz permutations have
// 2 4 3 1  cycle representation, ve can substitute wht the prev
//          one, as above, something like thus.               :)
////////////////////////////////////////////////////////////////
