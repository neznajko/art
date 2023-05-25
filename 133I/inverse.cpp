////////////////////////////////////////////////////////////////
# include <iostream>
# include <vector>
////////////////////////////////////////////////////////////////
using std::endl;
////////////////////////////////////////////////////////////////
std::ostream& operator<<( std::ostream& os,
                          const std::vector<int>& X ){
    os << "[ ";
    for( std::size_t j{ 1 }; j < X.size(); ++j ){
        os << X[ j ] << " ";
    }
    return os << "]";
}
////////////////////////////////////////////////////////////////
int main(){
    std::vector<int> X{ 0, 6, 2, 1, 5, 4, 3 };
    std::cout << X << endl;
    int m{ static_cast<int>( X.size()) - 1 };
    int j{ -1 };
    for(; m > 0; --m ){
        int i{ X[ m ]};
        if( i >= 0 ){
            for(;;){
                X[ m ] = j; j = -m; m = i; i = X[ m ];
                if( i <= 0 ){
                    i = j;
                    break;
                }}}
        X[ m ] = -i;
    }
    std::cout << X << endl;
}
////////////////////////////////////////////////////////////////
// The philosophical understanding that gravity is not a force,=
// is due to me because it doesn|t fit into the In\Yan principle
// not to Einstein. Einstein himself, if not mistaken wanted to_
// write an unification force, or something like that, if=======
// physicist have other understanding, philosophical or whatever,
// then there would not exist nonsense theories like haHa string
// theory etc. I can show you where, when and why I wrote this,=
// you show me where and when Einstein said that gravity is not=
// a force.====================================================_
///////////////////////////////////////////////////////////////=
