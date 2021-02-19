////////////////////////////////////////////////////////////////////////
using System;

namespace primes
{
    class Program
    {
        static int ROWZ = 50;
        static int COLZ = 10;
        static int SIZE = ROWZ*COLZ;
        static int[] prime = new int[SIZE];
        static void GenPrime()
        {
            prime[0] = 2;
            for (int j = 1, n = 3; j < SIZE; n += 2) {
                for (int k = 1; k < j; ++k) {
                    int p = prime[k];
                    if (0 == (n%p)) goto Skip; // not a prime number
                    if ((n/p) <= p) break;     // n is prime
                }
                prime[j++] = n;
Skip:           continue; 
            }
        }
        static void Spit()
        {
            Console.WriteLine("Spit");
            for (int i = 0; i < ROWZ; ++i) {
                string s = "";
                for (int j = i; j < SIZE; j += ROWZ) {
                    s += $"{prime[j]: 0000}";
                }
                Console.WriteLine(s);
            }
        }
        static void Main(string[] args)
        {
            Console.WriteLine("primes");
            GenPrime();
            Spit();
        }
    }
}
// log:
