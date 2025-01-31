#!                                                     /bin/bash
################################################################
X=($@) #      take the permutation from command line as an array
################################################################
N=$(( ${#X[*]} - 1 )) #                         permutation size
################################################################
printf "%x " ${X[@]}; echo
###############################################################=
prev=0 #  in permutatn cycle we have thus .. prev->curr->next ..
curr=${N} #    and we want to convyort it .. prev<-curr<-next ..
################################################################ の
################################################################ む
################################################################ 飲
################################################################ む
#########################    ___                    ############
####       . ` .       ##   /  /___________________ ############
####   . ` . ` . ` .   ##  /  _________________   / ####### пити U
#### ` . `  ###  ` . ` ## /__/                /__/  ############
#########         ######################################## beber S
#########   ###   #######```````_____@``````````````############
#########         #######``````_____@```````````````#### trinken G
#########   ###   #######`````_____@__@`````````````############
#########         #######````_____@_____@```````````###### boire F
#########   #############```_____@`` _____@`````````############
#########   #############``_____@````` _____@```````####### bere I
####     ###    `  `    #`_____@```````` _____@`````############
####     ########`  `   #_____@``````````` _____@```############
#### ########     `  `  #____@`````````````` _____@`############
####  ##           `  ` ########################################
####                    ##  to drink  ##########################
################################################################
################################################################
while (( curr > 0 )); do
    if (( X[curr] < 0 )); then
        X[curr]=$((-X[curr]))
        ((--curr))
    else
        while :; do
            next=${X[curr]}
            X[curr]=$((-prev))
            if (( next == 0 )); then
                prev=0
                break
            fi
            prev=${curr}
            curr=${next}
        done
    fi
done
################################################################
printf "%x " {0..15}; echo
printf "%x " ${X[@]}; echo
################################################################
################################################################
################################################################
################################################################ き
################################################################ く
################################################################ 聞
################################################################ く
############      ##      ##  listen  ##########################
############  @@  ##  ^^  ######################################
############      ##      #####################################i Ascoltare
############  //  ##  __  ######################################
############      ##      #####################################f ècouter
############  ##########  ######################################
############              #####################################g Hören
############  \\  ==  ##  ######################################
############  \\      ##  #####################################s escuchar
############  \\  ..  ##  ######################################
############  \\      ##  #####################################u слухати
############  \\  --  ##  ######################################
############          ##  ######################################
############  ######  ##  ######################################
############  ######  ##  ######################################
################################################################
################################################################
################################################################
# log:
