#include <iostream>
#include <vector>
#include <iterator>
#include <algorithm>
template <typename T>
std::ostream& operator<< (std::ostream& strm, const std::vector<T>& vec)
{
  strm << "[";
  if (!vec.empty()) {
    std::copy(vec.begin(), vec.end() - 1, std::ostream_iterator<T>(strm, ", "));
    strm << vec.back();
  }
  return strm << "]";
}
using namespace std;
bool next(vector<int>& vec)
{
  const int n{ (int)vec.size()-1 }; // back
  // [find j]
  int j{ n-1 };
  for (; vec[j]>vec[j+1]; --j) {}
  if (j==0) return false; // last perm has been generated
  // [increace j]
  int r{ n };
  for (; vec[r]<=vec[j]; --r) {}
  swap(vec[j],vec[r]);
  // [reverse]
  for (++j,r=n; j<r; ++j,--r) {
    swap(vec[j],vec[r]);
  }
  return true;
}
int main()
{
  vector<int> vec{ 0, 1, 2, 3, 4 };
  do {
    cout << vec << endl;
  } while (next(vec));
}
