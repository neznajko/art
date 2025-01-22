////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// <> 2.1.11. Find the acceleration of the loads and the tension
// forces of the threads in the system shown in the figure. The 
// block and threads are weightless, there is no friction.
// /////////////////////////////////////////////////////////////
// ###########|########### #####################################
// ##   ######|########### ## If load 1 has acceleration a, load
// ## | #####   ########## ## 2 will have -a, and we can write   
// ## | ####     ######### ## the Newton laws for the loads as: 
// ## | ####  `  ######### #####################################
// ## v ####|   |######### ## m₁g - T = m₁a                  (1)
// ##   ####|###|######### ## m₂g - T = -m₂a                 (2)
// ## g ####|###|######### #####################################
// ##   ####|##   ######## ## The tension force T is due to the
// ########   # 2 ######## ## thread deformation and is same    
// ######## 1 #   ######## ## alongside its length if the thread
// ########   ############ ## is massless                    
// ####################### #####################################
// ####################### #####################################
////////////////////////////////////////////////////////////////
// ## (1) - (2): m₁g - T - m₂g + T = (m₁ + m₂)a                 
// ## (m₁ - m₂)g = (m₁ + m₂)a, so a = (m₁ - m₂)/(m₁ + m₂)        
// ## if m₁ > m₂, a will have the direction of g                
// #############################################################
////////////////////////////////////////////////////////////////
// ## (1)/m₁ + (2)/m₂: g - T/m₁ + g - T/m₂ = a - a = 0,         
// ## 2g = T(1/m₁ + 1/m₂) = T(m₁ + m₂)/m₁m₂, so                
// ## T = 2gm₁m₂/(m₁ + m₂)                                      
// #############################################################
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// So we have N records, with keys: K1, K2, ..., KN, then we
// create an auxiliary counting array of N elements initialized
// to nil, COUNT[j] = 0, 1 <= j <= N; Now for all C(N,2) = 
// N*(N-1)/2 ordered pairs (i,j): i < j, 2 <= j <= N we compare 
// Ki with Kj, if Ki < Kj, then we increment COUNT[j], otherwise 
// COUNT[i], at the end of thus COUNT[j] will hold the number of
// elements less then Kj, that is the position of jth Record in 
// the sorted sequence
////////////////////////////////////////////////////////////////
fn main() {
    println!( "The Comparison Counting Algorithm by Rust" );
    // Number of records
    const N: usize = 8;
    // Thus are the initial unsorted record keys
    const K: [ i32; N ] = [ 51, 8, 105, 14, 72, 18, 9, 2 ];
    // The auxiliary counter array initialized to nil
    let mut count = [ 0; N ];
    // Loop over all ordered (i,j) pairs
    for j in 1 .. N {
        for i in 0 .. j {
            // Compare and update the counters
            if K[i] < K[j] {
                count[j] += 1;
            } else {
                count[i] += 1;
            }
        }
    }
    // Dump some stuff
    println!( "count: {:?}", count );
    // count: [5, 1, 7, 3, 6, 4, 2, 0]
}
////////////////////////////////////////////////////////////////
// (2) たけしさんは　ごはんを　食べます。
//     たけしさんも　　パンを　食べます。
////////////////////////////////////////////////////////////////
// (3) ロバートさんは　コーヒーを　飲みます。 
//     ロバートさんも　　おちゃを　飲みます。
////////////////////////////////////////////////////////////////
// (4) メアリーさんは　　　　英語を　話します。 
//     メアリーさんも　スペイン語を　話します。 　
////////////////////////////////////////////////////////////////
// (5) 公園で　　写真を　撮ります。 
//     お寺でも　写真を　撮ります。
////////////////////////////////////////////////////////////////
// (6) 　　　家で　勉強します。
//     図書館でも　勉強します。
////////////////////////////////////////////////////////////////
// (7) 土曜日に　　デートをします。
//     日曜日にも　デートをします。
////////////////////////////////////////////////////////////////
// (8) 火曜日に　　テストが　あります。
//     木曜日にも　テストが　あります。
////////////////////////////////////////////////////////////////
// (9) 東京に　　行きます。
//     広島にも　行きます。
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 20. (a) Show using a story proof that
// C(k,k) + C(k+1,k) + C(k+2,k) + ... + C(n,k) = C(n+1,k+1),
// where n and k are positive integers with n ≥ k. This is 
// called the hockey stick identity.
// (b) Suppose that a large pack of Haribo gummy bears can have
// anywhere between 30 and 50 gummy bears. There are 5 delicious
// flavors: pineapple (clear), raspberry (red), orange (orange),
// strawberry (green, mysteriously), and lemon (yellow). There 
// are 0 non-delicious flavors. How many possibilities are there
// for the composition of such a pack of gummy bears? You can 
// leave your answer in terms of a couple binomial coefficients,
// but not a sum of lots of binomial coefficients.
////////////////////////////////////////////////////////////////
// (a) Here the notation C(n,k) is n!/k!(n-k)!, so there is a
// simpler formula that can be used to derive thus:
// Imagine we have n + 1 people, and that + 1 person is some
// special guy and we want to count the number of all ways we
// can pick a team of size k. So we can split into two separate
// cases: all teams that has this person plus all teams that
// have only common people:) In the first case cos we've already
// picked that guy we have to chose k - 1 from n, that is
// C(n,k-1) in the second case we have to pick k from n ignoring
// the special guy for C(n,k), so C(n+1,k) = C(n,k-1) + C(n,k). 
// Now we can apply the same logic to C(n,k):
// C(n,k) = C(n-1,k-1) + C(n-1,k), so we have 
// C(n+1,k) = C(n,k-1) + C(n-1,k-1) + C(n-1,k), for that 
// interpretation we can think of two special persons fyorst a
// General and the second a Lieutenant, so if General and
// Lieutenant are in the same team the General commands but if
// Lieutenant is in a team without General he commands, so we 
// can split into cases where the General is the boss: C(n,k-1) 
// plus the scenarios where the Lieutenant is in charge: 
// C(n-1,k-1) plus a team with only common people, etc.
// (b) say we have n gummy bears in a pack, 30 <= n <= 50, so
// every bear can have 5 different flavours, if x[j] is the 
// number of bears with flavour j in a pack then:
// x[1] + x[2] + x[3] + x[4] + x[5] = n, where 0 <= x[j] <= n,
// or in general x[1] + ... + x[r] = n, in a previous problem
// we have figured the numbers of solution to this equation, so
// I'm not going to do this again, but this is well known stuff
// it's picking a sample of size n from r with repetitions, also
// known as Bose-Einstein and I think bars and stars formula it
// is equal to C(n + r - 1, r - 1) = C(n + 4, 4), so we have to
// sum thus from n = 30 to n = 50: C(34,4) + .. C(54,4). Here we
// can use the above formula C(k,k) + ... C(n,k) = C(n+1,k+1):
// C(4,4) + .. + C(33,4) + C(34,4) + .. + C(54,4) = C(55,5), zo
// C(34,4) + .. + C(54,4) = C(55,5) - C(34,5)
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
