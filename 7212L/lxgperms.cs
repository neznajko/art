using System;
using System.Linq;

namespace lxgperms
{
    class prms 
    {
        int[] _a;
        void xchg(int i, int j)
        {
            int t = _a[i];
            _a[i] = _a[j];
            _a[j] = t; 
        }
        public prms(int[] a)
        {
            _a = new int[a.Length];
            a.CopyTo(_a, 0);
        }
        public bool next()
        {
            int n = _a.Length - 1; // last index
            // find j
            int j = n - 1;
            while (true) {
                if (_a[j] < _a[j + 1]) break;
                --j;
            }
            if (j == 0) return false;
            // increase a[j]
            int r = n;
            while (true) {
                if (_a[j] < _a[r]) break;
                --r;
            }
            xchg(j, r);
            // reverse
            ++j;
            r = n;
            while (j < r) {
                xchg(j, r);
                ++j;
                --r;
            }
            return true;
        }
        public override string ToString()
        { 
            return string.Join(", ", _a.Skip(1));
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("lxgperms");
            prms p = new prms(new int[]{0, 1, 2, 2, 4});
            do {
              Console.WriteLine(p);
            } while (p.next());
        }
    }
}
