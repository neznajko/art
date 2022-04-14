#!                                          /bin////////////bash
####----####____####````####,,,,####++++####    ####>>>>####....
m=( 0 2 3 2 4 ) # mixed base positional system 0 is search guard
n=$((${#m[@]}-1)) # behold! the least significant digit position
a=($( for(( j = 0; j <= n; j++)); do echo 0; done )) # the tuple
####,,,,````----    @@@@____====>>>>////    ****. . ~~~~____****
while :; do # An infinite loop but don't ask me why it's working
    echo ${a[@]:1} # skip 1 take 3 drop 2 jump 5 pass 4 and dump
    j=${n} # for some reason, they recommend these braces around
    for((; a[j] == m[j] - 1; j--)); do # check if it's new cycle
        a[$j]=0 ####----....````\\____>>>>****====....%%%% _ _ _ _
    done # # # #   *   .   ^   =   ,   `   *   p   *   _   <   ^   
    (( j == 0 )) && break ##    ####    ####    ####    ####
    (( a[j]++ )) ###    ####    ####    ####    ####    ####
done    ####    ####  4 ####    ####    ##&#    ####    ####   
####https://www.youtube.com/watch?v=RLWcYADoV84&t=2560s#########
