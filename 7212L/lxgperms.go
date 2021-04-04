package main
import "fmt"

func nextperm (a []int) bool{
  n := len (a) - 1 // last element
  j := n - 1
  for a[j] >= a[j + 1] { j-- }
  if j == 0 { return false }
  r := n // Japanese l
  for a[j] >= a[r] { r-- }
  a[j],a[r] = a[r],a[j]
  j++
  r = n
  for j < r {
    a[j],a[r] = a[r],a[j]
    j++
    r--
  }
  return true
}
func main () {
  a := []int{0, 1, 2, 3, 4}
  for {
    fmt.Println (a[1:])
    if !nextperm (a) { break }
  }
}
// log:
