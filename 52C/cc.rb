################################################################
K = [ -1, 5, 6, 7, 8, 1, 2, 3, 4 ]
N = K.length - 1
count = Array.new( N + 1, 0 )
i = N
while i > 1 do
    j = i - 1
    while j > 0 do
        if K[ i ] < K[ j ]
            count[ j ] += 1
        else
            count[ i ] += 1
        end
        j -= 1
    end
    i -= 1
end
p K
p count
################################################################
# I was thinking about the problem with the collapse of the wave
# function in the double slit experiment and it seems the
# problem is not it the collapse itself but cos the Schrödinger
# equation doesn't account for it, I mean in electron positron
# annihilation the electron doesn't remain even with one single
# state all states collapse to zero but the QED equations
# predict that outcome so to speak. So the Schr"dinger
# equation describes quantum particles, and here we have
# interaction between quantum and classical object the detector.
# One way of thinking about interaction between objects is in
# terms of their corresponding probability events, like circles
# in the Venn diagram. If two objects are not interacting their
# corresponding evens A and B will be independent and will not
# overlap, so the interaction can be viewed as the cross-section
# between events A and B, when we fire A, B can fire as well.
# So if we describe the detector at a given position as a
# quantum object with a wave function having probability
# ( 0, 0, 0, 0, 0, 1, 0, 0 ) and the electron as:
# ( a, b, c, d, f, g, h, i ), then after the interaction the
# cross-section will leave the electron in a state
# ( 0, 0, 0, 0, 0, g, 0, 0 )
