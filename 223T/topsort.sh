#!                                                     /bin/bash
################################################################
bufr=($(cat ./paper.dev)) # thats the way to go
n=${bufr[1]} # number of graph nodes
CUNT=($( for(( j = 0; j <= n; j++ )); do echo  0; done ))
SUCC=($( for(( j = 0; j <= n; j++ )); do echo ""; done ))
for(( j = 2; ; j += 2)); do
    u=${bufr[j]}
    v=${bufr[j + 1]}
    (( u == v )) && break
    (( CUNT[ v]++ ))
    SUCC[$u]="$v ${SUCC[u]}" # that's the linked list
done
################################################################
declare -n QUEUE=CUNT
dmp() {
    for(( j = 0; j <= n; j++)); do
        echo "$j: (${CUNT[j]}) ${SUCC[j]}"
    done
}; dmp
################################################################
R=0
for(( j = 1; j <= n; j++ )); do
    if(( CUNT[j] == 0 )); then
        QUEUE[$R]=$j; R=$j
    fi
done
################################################################
F=${QUEUE[0]}; echo -n "topsort:"
while(( F != 0 )); do
    echo -n " $F"
    for v in $(echo ${SUCC[F]}); do
        (( --CUNT[ v] == 0 )) && {
            QUEUE[$R]=$v; R=$v 
        }
    done
    F=${QUEUE[F]}
done; echo
################################################################
