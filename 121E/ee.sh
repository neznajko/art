#!/bin/bash
################################################################
# algorithm invariants:
# A( m ) + B( n ) = c                                        (1)
# a( m ) + b( n ) = d                                        (2)
m=40 # 2*2*2*5
n=15 # 3*5
# E1.[Initialize.]
# a <- 0, b <- 1
# A <- 1, B <- 0
# c <- m, d <- n
# after this step (1), (2) hold the door
a=0; b=1
A=1; B=0
c=${m}; d=${n}
while :; do
# E2.[Divide.]
# c = dq + r
    q=$((c/d))
    r=$((c%d))
# E3.[Remainder zero?] 
    (( r == 0 )) && break
# E4.[Recycle.]
# Am + Bn = c
# am + bn = d -> aqm + bqn = qd
# c = dq + r  -> c - dq = r
#    
# (A - aq)m + (B - bq)n = c - dq = r
# am + bn = d
#
#        am +        bn = d
# (A - aq)m + (B - bq)n = r
#
# c <- d, 
# d <- r,
# A <- a
# a <- A - qa
# B <- b
# b <- B - qb
    c=${d}
    d=${r}
    t=${A}
    A=${a}
    a=$(( t - q*a ))
    t=${B}
    B=${b}
    b=$(( t - q*b ))
done
echo "${a}*${m} + ${b}*${n} = ${d}"
################################################################
# log: https://youtu.be/jPc-o-4Nsbk
#
