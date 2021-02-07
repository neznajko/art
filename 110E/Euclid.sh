#! /bin/bash
m=2166
n=6099
## update m and n from input if available
argc=${#}
argv=("${@}")
(( 0 < argc )) && m=${argv[0]}
(( 1 < argc )) && n=${argv[1]}
## save output string to s
printf -v s "GCD(%d,%d)=" ${m} ${n}
## exchange m and n if necessary
(( m < n )) && {
    temp=${m}
    m=${n}
    n=${temp}
}
while :; do
    r=$(( m % n ))
    (( r == 0 )) && break
    m=${n}
    n=${r}; done
## output the result
printf "${s}${n}\n"
## log:
