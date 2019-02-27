package main
import "fmt"
func main() {
	var (
		m = 2166	
		n = 6099
		r int
	)
	for true {
		fmt.Printf("%d %d\n", m, n)
		r = m % n
		if r == 0 {
			break
		}
		m = n
		n = r
	}	
}
