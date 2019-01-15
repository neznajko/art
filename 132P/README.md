Algorithm P (Print table of 500 primes). This algorithm has two distinct
parts: Steps P1-P8 prepare an internal table of 500 primes, and steps P9-P11
print the answer in the form shown above. The latter part uses two "buffers,"
in which line images are formed; while one buffer is being printed, the other
one is being filled.
 P1. [Start table.] Set PRIME[1] <- 2, N <- 3, J <- 1. (In the following
     steps, N will run through the odd numbers that are candidates for
     primes; J will keep track of how many primes have been found so far.)
 P2. [N is prime.] Set J <- J + 1, PRIME[J] <- N.
 P3. [500 found?] If J = 500, go to step P9.
 P4. [Advance N.] Set N <- N + 2
 P5. [K <- 2] Set K <- 2. (PRIME[K] will run through the possible prime
     divisors of N.)
 P6. [PRIME[K]\N?] Divide N by PRIME[K]; let Q be the quotient and R the
     remainder. If R = 0 (hence N is not prime), go to P4.
 P7. [PRIME[K] large?] If Q <= PRIME[K], go to P2. (In such a case, N must
     be prime; the proof of this fact is interesting and a little unusual
     -- see exercise 6.)
 P8. [Advance K.] Increase K by 1, and go to P6.
 P9-P11 are not used here