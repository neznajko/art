
############################################
def euclid( m, n )
  if n == 0
    return [ 1, 0, m ]
  end
  a, b, d = euclid( n, m % n )
  [ b, a - ( b * ( m / n )), d ]
end
m = 2166
n = 6099
a, b, d = euclid( m, n )
puts "#{m}*#{a}+#{n}*#{b}=#{d}" 
############################################
# log: There is no god that rules, there is 
# a rule that is god.
#
