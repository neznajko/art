#include <cstdio>    // printf
#include <algorithm> // swap
int gcd(int m, int n)
{
  if (m < n) {
    std::swap(m, n);
  }
  while (true) {
    int r = m % n;
    if (r == 0) break;
    m = n;
    n = r;
  }
  return n;
}
int main()
{
  int m = 2166;
  int n = 6099;
  printf("GCD(%d,%d)=%d\n", m, n, gcd(m, n));
}
// log:
