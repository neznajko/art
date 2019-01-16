**Algorithm C** (Comparison counting). This algorithm sorts  
R<sub>1</sub>,...,R<sub>N</sub> on the keys K<sub>1</sub>,...,K<sub>N</sub> by maintaining an auxiliary  
table COUNT[1],...,COUNT[N] to count the number of keys less  
than a given key. After the conclusion of the algorithm,  
COUNT[j] + 1 will specify the final position of record Rj.  
**C1.**[Clear COUNTs] Set COUNT[1] through COUNT[N] to zero.  
**C2.**[Loop on i] Perform step C3, for i = N, N - 1, ..., 2; then  
   terminate the algorithm.  
**C3.**[Loop on j] Perform step C4, for j = i - 1, i - 2, ..., 1  
**C4.**[Compare K<sub>i</sub>:K<sub>j</sub>] If K<sub>i</sub> < K<sub>j</sub>, increase COUNT[j] by 1;  
   otherwise increase COUNT[i] by 1.
<sub></sub>
