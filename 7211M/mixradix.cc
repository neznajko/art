////////////////////////////////////////////////////////////////
# include <iostream>
# include <vector>
////////////////////////////////////////////////////////////////
typedef std::vector <int> vint; 
////////////////////////////////////////////////////////////////
void visit( const vint& vec ){
    for( int j = 1; j < vec.size(); j++ ){
        std::cout << vec[ j] << " ";
    }
    std::cout << std::endl;
}
////////////////////////////////////////////////////////////////
void gentuple( vint&& m ){ // reference to a temporary
    m.insert( m.begin(), 2 ); // Guard
    vint a( m.size(), 0 ); // That will be the tuple.
    const int n = m.size() - 1;
    while( true ){
        visit( a );
        int j = n;
        for(; a[ j ] == m[ j ] - 1; j-- ) a[ j ] = 0; // rewind
        if( j == 0 ) break; // Sentinel reached; done.
        a[ j ]++;
    }
}
////////////////////////////////////////////////////////////////
int main() {
    // These are the dimensions of the tuple, we want to
    // generate, they represent different bases of some
    // positional systems. The tuple is interpreted as a number
    // in this, so called mixed-radix system, and by adding one,
    // all tuples are generated. For example if we add 1 to 0004
    // we'll get 0010, and so on, until last 2314 tuple is
    // reached.
    gentuple({ 3, 4, 2, 5 });
}
////////////////////////////////////////////////////////////////
// 0 0 0 0 
// 0 0 0 1 
// 0 0 0 2 
// 0 0 0 3 
// 0 0 0 4 
// 0 0 1 0 
// 0 0 1 1 
// 0 0 1 2 
// 0 0 1 3 
// . . . .
// . . . .
// . . . .
// . . . .
// 2 3 0 0 
// 2 3 0 1 
// 2 3 0 2 
// 2 3 0 3 
// 2 3 0 4 
// 2 3 1 0 
// 2 3 1 1 
// 2 3 1 2 
// 2 3 1 3 
// 2 3 1 4 
