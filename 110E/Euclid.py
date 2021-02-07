#!/usr/bin/env python3
import sys
########################################################
argv = [ 2166, 6099 ] # default values
# update argv with command line arguments
for j in range (1, len (sys.argv)):
  argv[ j -1] = int (sys.argv[ j])
m, n = argv
while True:
  r = m %n
  if r == 0: break
  m, n = n, r
print ("gcd({},{}) = {}".format (*argv, n))
########################################################
# log:
