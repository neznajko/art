#!                                             /usr/bin/env perl
################################################################
use strict;
use warnings;
my @f1 = split( //, "(acfg)(bcd)(aed)(fade)(bgfae)="); # formula
my @tg = split( //, "------------------------------"); # tag
my @ut = split( //, "=============================="); # output
my $gp = $#f1; # guard position
################################################################
sub dnp {                       # = = = = = = = = = = = = = = =
    print( join '', @f1, "\n"); #  
    print( join '', @tg, "\n"); # -   -   -   _   -   -   -   _
    print( join '', @ut, "\n"); # o   o   o   O   o   o   o   O
}                               #
################################################################
sub fstpas {                          #
    for( my $j = 0; $j < $gp; $j++) { #
        if( $f1[ $j] eq '(') {        #
            $tg[ $j] = 'v';           #
            $f1[ $gp] = $f1[ $j+1];   # backup next lmnt =======
        } elsif( $f1[ $j] eq ')') {   #
            $tg[ $j] = 'v';           # 
            $f1[ $j] = $f1[ $gp];     # copy ===================
        }                             #
    }                                 #
}                                     # 
################################################################
&dnp();    #                   w   w   w   a       s   t   i   ?
&fstpas(); # _                   o       h   t   i       h   s
&dnp();    #                                                   _
################################################################
my $start = 0; # position of cycle's starting lmnt
my $cx;        # the register( scanning position)
my $bx = 0;    # output position
#######################################################[ start ]
sub find_start() {                   # c       k t   i       t #
    while( $tg[ ++$start] eq "v") {} #     e c         s   u   # 
}                                    #   h         h     o     #
#######################################################[ cycle ]
sub cycle() {                    # |T| | | | | | | | | | |L|E| #
    &find_start();               # | | |à| | | | | | | |¢| | | #
    if( $start eq $gp) {         # | |h| | |s| | | |c| | | | | #
        return 0;                # | | | |‡| | |ª| | |¥| | | | #
    }                            # | | | | | | | | | | | | | | #
##### tag the start ############## | | | |T| | |A| | | | | | | ### 
    $tg[ $start] = "v";          # | |h| | |§| | | |©|¥|©|£|È| #
##### setup cx and the key ####### | | | | | | | | | | | | | | ### 
    $cx = $start + 1;            # |†| | | | | | | | | | | | | #
    $f1[ $gp] = $f1[ $cx];       # | | | | | | | | | | | | | | #
##### output cycle's beginning ### | | |ã| | | | | | | | | | | ###
    $ut[ $bx++] = "(";           # | | | | | | | | | | | | | | #
    $ut[ $bx++] = $f1[ $start];  # |t| |a| |s| | | |c| |c| |e| #
    for( ;;) {                   # | |H| |T| | |A| | |Y| |L| | #
        &scan();                 ###############################
        # ck if key equal to starting lmnt #####################
        if( $f1[ $start] eq $f1[ $gp]) { #######################
            last;                ###############################
        } # output key           ###############################
        $ut[ $bx++] = $f1[ $gp]; ###############################
        $cx = $start; # reset to start #########################
    }                            ###############################
    $ut[ $bx++] = ")";           ###############################
    return 1;                    ###############################
}                                ###############################
#################################################[ scan ]#######
sub scan() { # Expects cx and key set up.                    ###
    for( ;;) { #                                              ..  
        while( $f1[ ++$cx] ne $f1[ $gp]) {}                  ### 
        # Here there are equal ck if cx is at guard position ### ###
        if( $cx == $gp) { last; } #              thats break ###
        # Tag lmnt at cx, setup next one as key and continue ###
        $tg[ $cx++] = "v"; # Now_ cx_ is over_ the next_ key ###
        $f1[ $gp] = $f1[ $cx]; # copy key to_ guard position ###
    }                                                        ###
}                                                            ###
while( &cycle()) {}
&dnp();
################################################################
# log:
################################################################
#  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #  #
