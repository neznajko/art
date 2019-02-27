#!/usr/bin/env python3
import math
########################################################
def Sum(ACCR):
    m = 10**(ACCR + 1)
    Q = 5
    S = 0
    n = math.floor(m/Q)
    while True:
        Q = Q + 10              
        f = math.floor(m/Q) + 1 
        if f == n:              
            break
        S = S + math.floor(Q/10)*(n - f + 1)
        n = f - 1
    while True:
        Q = math.floor(m/f)
        S = S + math.floor((Q + 5)/10)
        f = f - 1
        if f == 0:
            break
    return S/10**ACCR
########################################################
def CK(ACCR):
    m = 10**(ACCR + 1)
    Q = 5
    S = 0
    n = math.floor(m/Q)
    for j in range(n, 0, -1):
        Q = math.floor(m/j)
        R = m%j
        S = S + math.floor((Q + 5)/10)
        print(j, '\t|', Q, '\t\t|', R, '\t|', S)
        print("--------+-------+-------+-------+")
########################################################
for ACCR in range(1, 6):
    print(ACCR, Sum(ACCR))
