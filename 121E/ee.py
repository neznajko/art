#!/usr/bin/env                                           python3
################################################################
def extdEuclid( m, n ):
    """ am + bn = d """
    """ αm + βn = c """
    #### Initialize #### < < < < < < < < < < < < < < < < < < < <
    a, b = 0, 1
    α, β = 1, 0
    c, d = m, n
    while True:
        #### Divide #### » » » » » » » » » » » » » » » » » » » »
        # c = qd + r
        q, r = c//d, c%d
        #### Remaindr zero? #### ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` `
        if r == 0: break
        #### Recycl #### - - - - - - - - - - - - - - - - - - - -
        c, d = d, r
        t = α
        α = a
        a = t - q*a
        t = β
        β = b
        b = t - q*b
    return a, b, d
################################################################
if __name__ == '__main__':
    m, n = 2166, 6099
    a, b, d = extdEuclid( m, n )
    print( f"({a})*{m}+({b})*{n}={d}" )
################################################################
# α - 03b1
# β - 03b2
# log: If you want to type the above characters in Emacs type
# C-x 8 Enter, and than insert the character's code.
