#!/bin/bash
prime=([0]=2 [1]=3)
n=5
L=500 # table size
R=50  # table rows
isprime() {
  for (( k = 1;; ++k )); do
    if (( n%prime[k] == 0 )); then
      echo 0
      return
    elif (( n/prime[k] <= prime[k] )); then
      echo 1
      return
    fi
  done
}
for (( j = 2 ; j < L; n += 2 )); do
  (( $(isprime) == 1 )) && (( prime[j++]=n ))
done
# spit
for (( i = 0; i < R; ++i )); do
  s=""
  for (( j = i; j < L; j += R )); do
    printf -v buf " %04d" ${prime[j]}
    s+=$buf
  done
  echo "$s"
done
# log:
