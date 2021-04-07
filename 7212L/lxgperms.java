import java.util.Arrays;

public class lxgperms
{
  static boolean next (int[] a)
  {
    int n = a.length - 1; // last ndx
    // [ find j ]
    int j = n - 1;
    for (; a[j] >= a[j + 1]; --j)
      ;
    if (j == 0) return false; // no moar
    // [ increace a[j] ]
    int r = n; // Japanese l
    for (; a[j] >= a[r]; --r)
      ;
    int t = a[j]; a[j] = a[r]; a[r] = t;
    // [ reverse ]
    for (r = n, ++j; j < r; ++j, --r) {
      t = a[j]; a[j] = a[r]; a[r] = t;
    }
    return true;
  }
  static public void main (String[] args)
  {
    System.out.println ("Lexicographic permutations");
    int[] a = new int[] {0, 1, 2, 2, 4};
    do {
      int[] copy = Arrays.copyOfRange (a, 1, a.length);
      System.out.println (Arrays.toString (copy));
    } while (next (a));
  }
}
// log: Buttfeld!
