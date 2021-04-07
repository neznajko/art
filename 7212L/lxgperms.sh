#!/bin/bash
a=(0 1 2 3 4)
function wow()
{
    local i=$1
    local j=$2
    local t=${a[i]}; a[i]=${a[j]}; a[j]=$t
}
function njex()
{
    local n=$(( ${#a[@]} - 1 ))
    # [ find j ]
    local j=$(( n - 1 ))
    for (( ; a[j] >= a[j + 1]; --j )); do :; done
    (( j == 0 )) && return 0
    # [ increace a[j] ]
    local r=$n
    for (( ; a[j] >= a[r]; --r )); do :; done
    wow $j $r
    # [ reverse ]
    for (( r = n, ++j; j < r; ++j, --r )); do
        wow $j $r
    done
    return 1
}
while :; do
    echo "${a[@]:1}"
    njex
    (( $? == 0 )) && break
done

# log:
