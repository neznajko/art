#include <iostream>
#include <string>

using namespace std;

string a{ "(acfg)(bcd)(aed)(fade)(bgfae)" };
size_t n{ a.size() };
size_t back{ n - 1 };
string tag( n, '0' );

void frst_pass()
{
  char copy;
  
  for( int j{ 0 }; j < n; ++j ){
    if( a[j] == '(' ){
      tag[j] = '1';
      copy = a[j + 1];
    } else if( a[j] == ')' ){
      tag[j] = '1';
      a[j] = copy;
    }
  }
}
int frst_ntag( int j )
// find first untagged element
{
  while(( ++j < back )and( tag[j] == '1' ))
    ;
  if( j == back ) return -1;
  tag[j] = '1';
  return j;
}
int main()
// j - start
// i - current
{
  // A1
  frst_pass();
  string out;
  for( int j{ 0 }; ( j = frst_ntag( j )) != -1; ){
    // A2
    out += "(";
    out += a[j];
    for( int i{ j + 1 }, k{ j + 2 };; ){
      // A3(4)
      for(; k < back; ++k ){
        if( a[k] == a[i] ){
          tag[k++] = '1';
          i = k;
        }
      }
      // A5
      if( a[i] == a[j] ){ // current = start?
        out += ")";
        break;
      } else {
        out += a[i];
        k = j + 2;
        continue;
      }
    }
  }
  cout << out << endl;
}
// log:
