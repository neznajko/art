////////////////////////////////////////////////////////////////
# include <string>
# include <algorithm> // swap
# include <vector>
# include <iostream>
////////////////////////////////////////////////////////////////
template <typename T>
std::ostream& operator<<( std::ostream& os, const std::vector<T>& v ){
    for( int j = 0; j < v.size(); j++ ){
        os << "[,"[ j > 0] << v[ j];
    }
    return os << "]";
}
///////////////////////////////////////////////////////////////_
int main() {
    std::string f1{ "(acfg)(bcd)(aed)(fade)(bgfae)" };
    int n{ 'g' - 'a' + 1 }; // lazy loading
    std::vector<int> T;
    int z, j; // don't use uninitialized variables
    for( j = 0; j < n; j++ ) T.push_back( j );
    for( int k = f1.size() - 1; k >= 0; k-- ){
        char c{ f1[k] };
        if( c == ')' ){
            z = -1; // set to -1 cos T is 0-based here
        } else if( c == '(' ){
            T[j] = z;
        } else {
            int i{ c - 'a' };
            std::swap( T[i], z );
            if( T[i] == -1 ) j = i;
        }
    }
    std::cout << T << std::endl;
}
////////////////////////////////////////////////////////////////
// log: g++ machine.cpp && ./a.out, will spit as follows:
//      [3,2,4,6,1,5,0], vhich corresponds to
//       d c e g b f a
//

