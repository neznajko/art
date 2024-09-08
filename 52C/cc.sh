#!/bin/bash
################################################################
K=( -1 1245 4414 3415 8914 3815 4149 1484 2048 2473 )
N=$(( ${#K[*]} - 1 ))
################################################################
C=( 0 0 0 0 0 0 0 0 0 0 )
i=${N}
################################################################
while (( i > 1 )); do
    j=$(( i - 1 ))
    while (( j > 0 )); do
        if (( K[ i ] < K[ j ])); then
            (( ++C[ j ]))
        else
            (( ++C[ i ]))
        fi
        (( --j ))
    done
    (( --i ))
done
################################################################
echo ${C[@]}
################################################################
################################################################
################################################################
# log: 4 months without tv no news basically no radio don't miss
# a thing( except beautifull girls ) and have to tell you no ads
# is like a blessing, I've started watching   some YouTube clips
# about consciousness philosophy kind of     stuff, bcos is very
# hard to be isolated from everything, this    is not normal I'm
# saying something and  everybody rabbit, rabbit hole, relax I'm
# going out from your    territory, good luck:) by the way every
# metaphysical statement    cos you can say everything should be
# as a consequence of a more        general or global theory, my
# theory is the In Yan principle: good and bad are not white and
# black, that is are not opposites     or contrasts, the harmony
# between contrasts is the good, that is   the essence from here
# everything follows, I don't want to be a  guru dont want to be
# a leader dont want to have       followers don't care what you
# believe etc. just wanted to share        it with the World, in
# gallery/all_1.ora I have tried to write __all__ I know, and as
# a response got all the hate from you, this is not normal. Ok I
# talk bullshit  Ok, don't be woke dont go in the rabbit hole ok
# I don't care where you going, I mean is too much I'm too tired
# of everything. According to this principle there can't be only
# material world there  must  exist not material world as well I
# call it nothingness  but it means not material it doesn't mean
# not existing the In Yan  principle  is   the existence and the
# harmony between material and not material   world is birth and
# death, for this only reason based on  this principle I've made
# the statement that our self is not    material this is it. I'm
# wrong this is pseudo science rabbit     hole ok call it as you
# want no problem        this       is      my            theory
################################################################
