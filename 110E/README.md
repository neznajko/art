**Algorithm E** *(Euclid's algorithm)*. Given two positive
integers *m* and *n*, find their greatest common divisor,
that is, the largest positive integer that evenly divides
both *m* and *n*.

**E1**. [Find remainder] Divide *m* by *n* and let *r* be the 
    remainder. (We will have *0 &le; r &lt; n*)
    
**E2**. [Is it zero?] If *r = 0*, the algorithm terminates; *n* is
    the answer
    
**E3**. [Reduce] Set *m &larr; n*, *n &larr; r*, and
    go back to step E1