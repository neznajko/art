################################################################
# Algorithm I. Replace the permutation of {1..n}, X[1]X[2]..X[n], 
# by its inverse in-place. The algorithm is due to Bing-Chao
# Huang( Chinese I guess ).
###############################################################_
#     0  1  2  3  4  5  6
X = [ 0, 6, 2, 1, 5, 4, 3 ]
n = len( X ) - 1
print( X[ 1: ])
###############################################################=
m, j = n, -1 # I1 { Initialize. } Set m <_ n, j « -1
while m > 0: 
    i = X[m]   # I2 [ Next element. ] Set i <- X[m]. If i < 0,
               # go to step I5
    if i >= 0: #
        while True:  # I3 ( Invert one. )
            X[m] = j #
            j = -m   #
            m = i    #
            i = X[m] #
            if i <= 0: # I4 « End of cycle » If i > 0, go back
                i = j  # to I3, otherwise set i <- j
                break
    X[m] = -i # I5 < Store final value. >
    m -= 1 # I6 / Loop on m /
################################################################
print( X[ 1: ])
################################################################
# Basically I don|t understand nothing' that,s the output=
# [6, 2, 1, 5, 4, 3]
# [3, 2, 6, 5, 4, 1]
#
