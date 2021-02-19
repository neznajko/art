package main
import "fmt"

const SIZE int = 500 // table size
var prime [SIZE]int  // primes array

func isprime(n int, j int) bool {
  for k := 1; k < j; k++ {
    p := prime[k]
    if n % p == 0 { return false }
    if n / p <= p { break }
  }
  return true
}
func spit() {
  const LINEZ int = 50
  for i := 0; i < LINEZ; i++ {
    buf := ""
    for j := i; j < SIZE; j += LINEZ {
      buf += fmt.Sprintf(" %04d", prime[j])
    }
    fmt.Println(buf)
  }
}
func main() {
  fmt.Printf("Table of first 500 primes\n")
  prime[0] = 2
  for j, n := 1, 3;; n += 2 {
    if isprime(n, j) {
      prime[j] = n
      j++
      if j == SIZE { break }
    }
  }
  spit()
}
// log:
