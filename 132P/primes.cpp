#include <cstdio>
#include <string>
#include <vector>
using namespace std;

typedef vector<int> vint_t;

string fmt(int n)
{
  static const int w = 4;
  static const string z{"000"};  
  string s = z + to_string(n);
  return " " + s.substr(s.length() - w, w);
}
bool is_prime(vint_t& p, int n)
{
  for (int k = 1;; ++k) {
    if (n%p[k] == 0   ) return false;
    if (n/p[k] <= p[k]) return true ;
  }
}
vint_t get_primes(int size)
{
  vint_t p{2, 3};
  
  for (int n = 5; p.size() < size; n += 2) {
    if (is_prime(p, n)) p.push_back(n);
  }
  return p;
}
void spit(const vint_t& p, int linez)
{
  printf("Table of first %lu primes:\n", p.size());
  for (int i = 0; i < linez; ++i) {
    string s;
    for (int j = i; j < p.size(); j += linez) {
      s += fmt(p[j]);
    }
    puts(s.c_str());
  }
}
int main()
{
  spit(get_primes(500), 50);
}
// log:
