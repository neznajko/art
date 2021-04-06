using System;

namespace Euclid
{
    class Program
    {
        static void Main(string[] args)
        {
            int m = 2166;
            int n = 6099;
            if (0 < args.Length) m = Int32.Parse(args[0]);
            if (1 < args.Length) n = Int32.Parse(args[1]);
            String s = String.Format("GCD({0},{1})=", m, n);
            if (m < n) {
                int temp = m;
                m = n;
                n = temp;
            }
            while (true) {
                int r = m % n;
                if (r == 0) break;
                m = n;
                n = r;
            }
            Console.WriteLine(s + n);
        }
    }
}
// log:
// - Int32.Parse
// - String.Format
