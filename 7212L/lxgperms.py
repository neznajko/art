#! /usr/bin/env python3
########################################################################
# Algorithm L (Lexicographic permutation generation).
# Given a sequence of n elements a[1]...a[n], initially sorted so that
# a[1] <= a[2] <= .. <= a[n], this algorithm generates all
# permutations of {a}, visiting them in lexicographic order.
# An auxiliary element a[0] is assumed to be present for
# convenience; a[0] must be strictly less than the largest
# element a[n].
# L1.[Visit.] Visit the permutation {a}.
# L2.{Find j.} Set j <- n - 1. If a[j] >= a[j+1], decrease j by 1
#    repeatedly until a[j] < a[j+1]. Terminate the algorithm if j = 0.
#    (At this point j is the smallest subscript such that we've already
#    visited all permutations beginning with a[1]..a[j]. So the
#    lexicographically next permutation will make a[j] larger.)
# L3.[Increase a[j].] Set l <- n. If a[j] >= a[l], decrease l by 1
#    repeatedly until a[j] < a[l]. Then interchange a[j] <-> a[l].
# L4.[Reverse a[j+1]..a[n].] and return to L1.
#######################################################################
def xchg (a, i, j):
    """  """
    a[i], a[j] = a[j], a[i]

def nextperm (a):
    """ generate next permutation """
    n = len (a) - 1
    # L2. {Find j}
    j = n - 1
    while a[j] >= a[j + 1]: j -= 1
    if j == 0: return False # no moar
    # L3. [Increase a[j]]
    r = n
    while a[j] >= a[r]: r -= 1
    xchg (a, j, r)
    # L4. [Reverse a[j+1]..a[n]]
    j += 1
    r = n
    while j < r:
        xchg (a, j, r)
        j += 1
        r -= 1
    return True
########################################################################
if __name__ == '__main__':
    a = [0, 1, 2, 2, 4]
    while True:
        print(a[1:])
        if not nextperm (a): break
# log:
