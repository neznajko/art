public class primes {
  static int SIZE = 500;
  static int LINEZ = 50;
  static int[] prime;
  static boolean isPrime(int n)
  {
    for (int k = 1;; ++k) {
      int p = prime[k];
      if (n%p == 0) return false;
      if (p >= n/p) return true;
    }
  }
  public static void main(String[] args)
  {
    System.out.println("Table of first 500 numbers");
    prime = new int[SIZE];
    prime[0] = 2;
    prime[1] = 3;
    for (int n = 5, j = 2; j < SIZE; n += 2) {
      if (isPrime(n)) prime[j++] = n;
    }
    for (int i = 0; i < LINEZ; ++i) {
      String s = "";
      for (int j = i; j < SIZE; j += LINEZ) {
        s += String.format(" %04d", prime[j]);
      }
      System.out.println(s);
    }
  }
}
// log:
