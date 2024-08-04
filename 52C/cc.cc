////////////////////////////////////////////////////////////////
# include <vector>
# include <iostream>
////////////////////////////////////////////////////////////////
using namespace std;
////////////////////////////////////////////////////////////////
vector <int> get_count( const vector <int> & keys )
{
    int n = keys.size();
    vector <int> count( n, 0 );
    for( int i = n - 1; i > 1; --i ){
        for( int j = i - 1; j > 0; --j ){
            if( keys[ i ] < keys[ j ]){
                ++count[ j ];
            } else {
                ++count[ i ];
            }
        }
    }
    return count;
}
////////////////////////////////////////////////////////////////
ostream& operator <<( ostream& _, const vector <int> & vec ){
    _ << "[ ";
    for( int y: vec ){
        _ << y << " ";
    }
    return _ << "]";
}
////////////////////////////////////////////////////////////////
int main()
{
    vector <int> keys{ -1, 1051, 4301, 2424, 3481, 3414, 8434 };
    cout << keys << endl
         << get_count( keys ) << endl;    
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// In a branch of ai called Reinforcement Learning, a robot 
// interacts with environment and acts to maximize a certain
// value. Its image to the surrounding world is number of 
// parameters like distances to near objects etc., in this model 
// one can view robot's thinking as the algorithms provided by
// the programmers and its self or its ego as that number it
// want to maximize. So if we return to ourselves what is our
// thinking is a bit unclear although we think in terms of
// images cos this is what we perceive from our environment, but
// becoz we always want to maximize our freedom, what is our
// self in this view is quite obvious
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
