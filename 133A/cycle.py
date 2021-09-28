#!/usr/bin/env python3
########################################################
#                                                      #
# (acfg)(bcd)(aed)(fade)(bgfae),                   (6) #
#                                                      #
# Algorithm A (Multiply permutations in cycle form).   #
# This algorithm takes a product of cycles, such as    #
# (6), and computes the resulting permutation in the   #
# form of product of disjoint cycles. For simplicity,  #
# the removal of singleton cyles is not described here;#
# that would be a fairly simple extension of the       #
# algorithm. As this algorithm is performed, we        #
# successively "tag" the elements of the input formula;#
# that is, we mark somehow those symbols of the input  #
# formula that have been processed.                    #
#                                                      #
# A1.[First pass.] Tag all left parentheses, and       #
#    replace each right parenthesis by a tagged copy   #
#    of the element that follows its matching left     #
#    parenthesis.                                      #
# A2.[Open.] Searching from left to right, find the    #
#    first untagged element of the input. (If all      #
#    elements are tagged, the algorithm terminates.)   #
#    Set START equal to it; output a left parenthesis; #
#    output the element; and tag it.                   #
# A3.[Set CURRENT.] Set CURRENT equal to the next      #
#    element of the formula.                           #
# A4.[Scan formula.] Proceed to the right until either #
#    reaching the end of the formula, or finding an    #
#    element equal to CURRENT; in the latter case, tag #
#    it and go back to step A3.                        #
# A5.[CURRENT = START?] If CURRENT != START, output    #
#    CURRENT and go back to step A4 starting again at  #
#    the left of the formula (thereby continuing the   #
#    development of a cycle in the output).            #
# A6.[Close.] (A complete cycle in the output has been #
#    found.) Output a right parenthesis, and go back   #
#    step A2.                                          #
########################################################
PMT = b'(acfg)(bcd)(aed)(fade)(bgfae)'
LEFT, RYTE = b'()'
U, T = 0, 1
N = len( PMT )
########################################################
arr = bytearray( PMT )
tag = []
########################################################
def first_pass():
    for j, l in enumerate( arr ):
        if l == LEFT:
            copy = arr[j + 1]
            tag.append( 1 )
        elif l == RYTE:
            arr[j] = copy
            tag.append( 1 )
        else:
            tag.append( 0 )
########################################################
if __name__ == '__main__':
    if 0: import pdb; pdb.set_trace()
    first_pass()
    j = 0
    while True:
        j += 1                              # [ open ]
        while j < N and tag[j] == T: j += 1 #
        if j == N: break # we're done!      %
        start = arr[j]                      #
        print( f"({chr(start)}", end='' )   #
        tag[j] = T    # [ set current ]
        i = j + 1     #
        cure = arr[i] #
        while True:
            # [ scan ]
            ########################################
            i += 1                                 #
            while i < N and arr[i] != cure: i += 1 #
            if i == N: # [ start = current? ]
                if cure == start:      # [ close ]
                    print(')', end='') #
                    break              #
                else:
                    i = j + 1
                    print(chr(cure), end='')
            else:
                tag[i] = T    # [ set current ]
                i = i + 1     #
                cure = arr[i] #
    print()
#log:
