################################################################
def main():
    f1 = "(acfg)(bcd)(aed)(fade)(bgfae)"
    n = off( max( filter( nopar, f1 )))
    T = [ k for k in range( n + 1 )]
    Z, j = None, None
    for ch in reversed( f1 ):
        if ch == ')':
            Z = 0
        elif ch == '(':
            T[j] = Z
        else:
            i = off( ch )
            T[i], Z = Z, T[i]
            if T[i] == 0: j = i
        print( ch, " ",  " ".join( map( getelem, T[1:] )))
################################################################
def off( ch ): return ord( ch ) - ord( 'a' ) + 1
################################################################
def nopar( ch ): return ch != '(' and ch != ')'
################################################################
def getelem( off ):
    if off == 0: return ')'
    return chr( ord( 'a' ) + off - 1 )
################################################################
if __name__ == '__main__': main()
################################################################
#   )   a b c d e f g
#   e   a b c d ) f g
#   a   e b c d ) f g
#   f   e b c d ) a g
#   g   e b c d ) a f
#   b   e g c d ) a f
#   (   e g c d b a f
#   )   e g c d b a f
#   e   e g c d ) a f
#   d   e g c b ) a f
#   a   d g c b ) a f
#   f   d g c b ) e f
#   (   d g c b a e f
#   )   d g c b a e f
#   d   d g c ) a e f
#   e   d g c ) b e f
#   a   a g c ) b e f
#   (   a g c d b e f
#   )   a g c d b e f
#   d   a g c ) b e f
#   c   a g d ) b e f
#   b   a c d ) b e f
#   (   a c d g b e f
#   )   a c d g b e f
#   g   a c d g b e )
#   f   a c d g b f )
#   c   a c e g b f )
#   a   d c e g b f )
#   (   d c e g b f a
################################################################
# log:
