package main
////////////////////////////////////////////////////////////////
import "fmt"
////////////////////////////////////////////////////////////////
func main()                                                    {
     fmt.Println( "cc with golang"                             )
     keys := [ ... ] int { -1, 5, 4, 3, 2, 8, 1, 7, 6          }
     const n = len( keys                                       )
     var count [ n                                         ] int
     i := n -                                                  1
     for i > 1                                                 {
         j := i -                                              1
         for j > 0                                             {
             if keys[ i ] < keys[ j ]                          {
                 count[ j ]                                   ++
             } else                                            {
                 count[ i ]                                   ++
                                                               }
             j                                                --
                                                               }
         i                                                    --
                                                               }
     fmt.Println( count                                        )
                                                               }
////////////////////////////////////////////////////////////////
// Recently I've  learn about some morality problem known as the
// Trolley  Problem when you can do nothing, that will result of
// the death of 5  people  or  you can take an action of killing
// one person which will  save  the others. Good and bad are not
// contrasts  the  harmony  between  contrasts is the good becoz
// they build the whole stable otherwise  it  will  fall  apart.
// So good and bad  take  their  meanings from the whole or from
// the context if you want if it's good for the whole it is good
// if it is bad for the whole it  is  bad. Morality is not a set
// of static rules like in the  bible  "DON'T KILL!", if you are
// christian  and  you blindly follow that rule you can actually
// do bad  things  like  in  this  scenario, of course we do not
// consider  something special for the 5 persons like  that they
// are  orks  for example. Next  time we're going to discuss the
// topic of consciousness:)
