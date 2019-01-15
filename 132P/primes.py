#!/usr/bin/env python
# P1. [Start table]
prime = [2]  # prime list
n = 3        # prime candidate
mx = 500     # number of primes upper limit
skip = False # skip flag, if True n is prime
while True:
    # P2. [N is prime]
    prime.append(n)
    # P3. [500 found?]
    if len(prime) == mx:        
        break
    while True:
        n = n + 2 # P4. [Advance N]
        for k in prime[1:]: # P5. [K <- 2]
                            # P8. [Advance K]
            # P6. [PRIME[K]\N?]
            if n%k == 0:    
                break       # naah! ck next
            # P7. [PRIME[K] large?]
            if n/k <= k:
                skip = True 
                break       # yup!
        if skip:
            skip = False
            break
# output
linez = 50 # number of lines
for i in range(linez):
    buf = ''
    for j in range(i, mx, linez):
        buf = buf + ' ' + str(prime[j]).rjust(4, '0')
    print buf
