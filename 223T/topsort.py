                          ####
########################################################
# Therefore we will assume that the objects to be sorted
# are numbered from 1 to n in any order. The input of
# the program will be on tape unit 1: Each tape record
# contains 50 pairs of numbers, where the pair (j, k)
# means that object j precedes object k. The first pair,
# however, is (0, n), where n is the number of objects.
# The pair (0,0) terminates the input. We shall assume
# that n plus the number of relation pairs will fit
# comfortably in memory; and we shall assume that it is
# not necessary to check the input for validity. The
# output is to be the numbers of the objects in sorted
# order, followed by the number 0, on tape unit 2.
########################################################
# As an example of the input, we might have the pairs
# 9<2, 3<7, 7<5, 5<8, 8<6, 4<6, 1<3, 7<4, 9<5, 2<8. (18)
# It is not necessary to give any more pairs than are
# needed to characterize the desired partial ordering.
# Thus, additional relations like 9 < 8 (which can be
# deduced from 9 < 5 and 5 < 8) may be omitted from or
# added to the input without harm. In general, it is
# necessary to give only the pairs corresponding to
# arrows on a diagram such as Fig. 6.(*)
########################################################
# The algorithm that follows uses a sequential table
# X[l], X[2], ..., X[n], and each node X[k] has the form
# +---+---+---+---+---+---+
# | + | 0 |CONT[k]| TOP[k]|
# +---+---+---+---+---+---+
# Here CONT[k] is the number of direct predecessors of
# object k (the numberof pairs j < k that have appeared
# in the input), and TOP[k] is a link to the beginning
# of the list of direct successors of object k. The
# latter list contains entries in the format
# +---+---+---+---+---+---+
# | + | 0 | SUCK  | NEXT  |
# +---+---+---+---+---+---+
# where SUC is a direct successor of k and NEXT is the
# next item of the list. As an example of these
# conventions, Fig. 8 shows the schematic contents of
# memory corresponding to the input (18).
#      k   1   2   3   4   5   6   7   8   9
# CONT[k] [0] [1] [1] [1] [2] [2] [1] [2] [0]
#  TOP[k] [+] [+] [+] [+] [+] [+] [+] [+] [+]
#          v   v   v   v   v   ø   v   v   v
# SUCK[k] [3] [8] [7] [6] [8]     [4] [6] [5]
# NEXT[k] [+] [+] [+] [+] [+]     [+] [+] [+]
#          ø   ø   ø   ø   ø       v   ø   v
# SUCK[k]                         [5]     [2]
# NEXT[k]                         [+]     [+]
#                                  ø       ø
# Fig.8 (...)
########################################################
# Using this memory layout, it is not difficult to work
# out the algorithm. We want to output the nodes whose
# COUNT field is zero, then to decrease the COUNT fields
# of all successors of those nodes by one. The trick is
# to avoid doing any "searching" for nodes whose COUNT
# field is zero, and this can be done by maintaining a
# queue containing those nodes. The links for this queue
# are kept in the COUNT field, which by now has served
# its previous purpose; for clarity in the algorithm
# below, we use the notation QLINK [k] to stand for
# COUNT [k] when that field is no longer being used to
# keep a count.
#
# (*) some DAG
########################################################
# Algorithm T (Topological sort). This algorithm inputs
# pairs of relations j < k, indicating that object j
# precedes object k; in a certain partial ordering,
# assuming that 1 < j, k < n. The output is the set of n
# objects embedded in linear order. The internal tables
# used are: QLINK[0], COUNT [1] = QLINK[1],
# COUNT [2] = QLINK [2], ..., COUNT [n] = QLINK [n];
# TOP [1], TOP [2], ..., TOP [n]; a storage pool with
# one node for each input relation and with SUC and NEXT
# fields as shown above; P, a link variable used to
# refer to the nodes in the storage pool; F and R,
# integer-valued variables used to refer to the front
# and rear of a queue whose linksare in the QLINK table;
# and N, a variable that counts how many objects have
# yet to be output.
########################################################
# Tl. [Initialize.] Input the value of n. Set
# COUNT[k] <- 0 and TOP [k] <- ø for 1 < k < n. Set
# N <- n.
# T2. [Next relation.] Get the next relation "j < k"
# from the input; if the input has been exhausted,
# however, go to T4.
# T3. [Record the relation.] Increase COUNT [k] by one.
# Set P <= AVAIL, SUC(P) <- k, NEXT(P) <- T0P[j],
# TOP [j] <- P. Go back to T2.
# T4. [Scan for zeros.] (At this point we have completed
# the input phase; the input (18) would now have been
# transformed into the computer representation shown in
# Fig. 8. The next job is to initialize the queue of
# output, which is linked together in the QLINK field.)
# Set R <- 0 and QLINK [0] <- 0. For 1 < k < n examine
# COUNT [k], and if it is zero, set QLINK [R] <- k and
# R <- k. After this has been done for all k, set
# F <- QLINK [0] (which will contain the first value
# k encountered for which COUNT [k] was zero).
# T5. [Output front of queue.] Output the value of F. If
# F = 0, go to T8; otherwise, set N <- N - 1, and set
# P <- T0P[F]. (Since the QLINK and COUNT tables overlap,
# we have QLINK[R] = 0; therefore the condition F = 0
# occurs when the queue is empty.)
# T6. [Erase relations.] If P = ø, go to T7. Otherwise
# decrease COUNT[ SUC (P)] by one, and if it has thereby
# gone down to zero, set QLINK[R] <— SUC(P) and
# R <- SUC(P). Set P <- NEXT(P) and repeat this step.
# (We are removing all relations of the form "F < k" for
# some k from the system, and putting new nodes into the
# queue when all their predecessors have been output.)
# T7. [Remove from queue.] Set F <- QLINK[F] and go back
# to T5.
# T8. [End of process.] The algorithm terminates. If
# N = 0, we have output all of the object numbers in the
# desired "topological order," followed by a zero.
# Otherwise the N object numbers not yet output contain
# a loop, in violation of the hypothesis of partial
# order. (See exercise 23 for an algorithm that prints
# out the contents of one such loop.)
########################################################
#                                        THATS ALGORITHM
########################################################
def load( filename):#__________________________________0
    '''Return list of ( u, v) pairs, that is edges,____1
    with first pair in the form ( 0, n)._______________2
    ''' #______________________________________________3
    f = open( filename) #___f_or_____r___ea__di___n__g_4
    ls = [] #__________________________________________5
    while True: #___________________________ha_ha___ha_6
        line = f.readline().strip() #__________________7 ..
        if not line: break #_Don_______________________8
        ls.extend( list( map( int, line.split()))) #___9
    f.close() #________________________________________a
    ls.pop() #_discard_dzero,_dzero____________________b
    return list( zip( ls[::2], ls[1::2])) #____________c
########################################################
class Topsort: # H W O S T A S A E 
    """"""     #  O T U E H T P C ?                   oo
    def __init__( self, nput): #########################
        self.n = nput[ 0][ 1]
        self.cont = [ 0]*( self.n + 1)
        self.suck = [ [] for _ in range( self.n + 1)]
        for j, k in nput[ 1:]:
            self.cont[ k] += 1
            self.suck[ j].append( k)
        self.init_qlink() #                  THATS TRICK
    def init_qlink( self): #############################
        self.qlink = self.cont
        self.r = 0 # rear
        for k in range( 1, self.n + 1):
            if not self.cont[ k]:
                self.qlink[ self.r] = k
                self.r = k
        self.f = self.qlink[ 0] # front
    def sort( self): ###################################
        outbuf = [] # output buffer
        while self.f:
            outbuf.append( self.f)
            for k in self.suck[ self.f]:
                self.cont[ k] -= 1
                if not self.cont[ k]:
                    self.qlink[ self.r] = k
                    self.r = k
            self.f = self.qlink[ self.f]
        return outbuf
def main(): ############################################
    print( Topsort( load( "paper.dev")).sort())
#######################################################_
if __name__ == "__main__":
    main()
########################################################
# log:
########################################################
  ####=====####                          ####=====####
