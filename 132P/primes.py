#! /usr/bin/env python3
prime = [2] # prime list
n     = 3   # prime candidate
z     = 500 # number of primes upper limit
lines = 50  # number of output lines
while len (prime) < z:
  prime.append (n)
  while True:
    n += 2
    try:
      for p in prime [1:]:
        if n % p == 0: break              # nah! ck next
        if n// p <= p: raise Exception () # yup!
    except: break
for i in range (lines):
  buf = ''
  for j in range (i, z, lines):
    buf += ' ' + str (prime [j]).rjust (4, '0')
  print (buf)
################################################################
# log:
