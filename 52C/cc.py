################################################################
# Comparison counting
################################################################
K = [ -1, 1245, 4414, 3415, 8914, 3815, 4149, 1484, 2048, 2473 ]
################################################################
N = len( K ) - 1
################################################################
COUNT = [ 0 ] * len( K )
################################################################
i = N
################################################################
while i > 1:
################################################################
    j = i - 1
################################################################
    while j > 0:
################################################################
        if K[ i ] < K[ j ]:
################################################################
            COUNT[ j ] += 1
################################################################
        else:
################################################################
            COUNT[ i ] += 1
################################################################
        j -= 1
################################################################
    i -= 1
################################################################
print( K )
################################################################
print( COUNT )
################################################################
# On YouTube recently there are many videos about consciousness,
################################################################
# and stuff, and was wondering that there is no way how a robot,
################################################################
# can think like a human, unless it has a notion or awareness of
################################################################
# self existence so the famous thought of the French Philosopher
################################################################
# René Descartes: "I think therefore I am" is obviously wrong
################################################################
# the correct statement is I am therefore I think, and on this
################################################################
# videos some say that parts of the mind are not computational
################################################################
# you can ask and every programmer will tell you that the
################################################################
# coding part is the most trivial if you know what you are doing
################################################################
# and have understanding of the problem, the statement that
################################################################
# something is not computational means it is not understandable
################################################################
################################################################
################################################################
################################################################
