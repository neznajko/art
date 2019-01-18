**9.** [25] Location *INST* contains a *MIX* word that purportedly is a *MIX* instruction.  
Write a *MIX* program that jumps to location *GOOD* if the word has a valid *C-field*,  
valid *&plusmn;AA-field*, valid *I-field*, and valid *F-field*, according to *Table 1.3.1-1*; your pro-  
gram should jump to location *BAD* otherwise. Remember that the test for a valid *F-field*  
depends on the *C-field*; for example, if *C = 7(MOVE)*, any *F-field* is acceptable, but if *C  
= 8(LDA)*, the *F-field* must have the form *8L + R* where *0 &le; L &le; R &le; 5*. The *"&plusmn;AA"-  
field* is to be considered valid unless *C* specifies an instruction requiring a memory  
address and *I = 0* and *&plusmn;AA* is not a valid memory address.  
	*Note*: Inexperienced programmers tend to tackle a problem like this by writing a  
long series of test on the *C-field*, such as `LDA C; JAZ 1F; DECA 5; JAN 2F; JAZ 3F;`    
`DECA 2; JAN 4F;` ... This is not good practice! The best way to make multiway  
decisions is to prepare an auxiliary table containing information that encapsulates the  
desired logic. If there were, for example, a table of 64 entries, we could write `LD1 C;`    
`LD1 TABLE,1; JMP 0,1`--thereby jmuping very speedily to the desired routine. Other  
useful information can also be kept in such a table. A tabular approach to the present  
problem makes the probram only a little bit longer (including the table) and greatly  
increases its speed and flexibility.  
**&#9658; 10** [31] Assume that we have a *9 x 8* matrix  

<a href="https://www.codecogs.com/eqnedit.php?latex=\dpi{120}&space;\fn_jvn&space;\begin{pmatrix}&space;a_{11}&space;&&space;a_{12}&space;&&space;a_{13}&space;&&space;\cdots&space;&&space;a_{18}&space;\\&space;a_{21}&space;&&space;a_{22}&space;&&space;a_{23}&space;&&space;\cdots&space;&&space;a_{28}&space;\\&space;\vdots&space;&&space;\vdots&space;&&space;\vdots&space;&&space;\ddots&space;&&space;\vdots&space;\\&space;a_{91}&space;&&space;a_{92}&space;&&space;a_{93}&space;&&space;\cdots&space;&&space;a_{98}&space;\\&space;\end{pmatrix}" target="_blank"><img src="https://latex.codecogs.com/png.latex?\dpi{120}&space;\fn_jvn&space;\begin{pmatrix}&space;a_{11}&space;&&space;a_{12}&space;&&space;a_{13}&space;&&space;\cdots&space;&&space;a_{18}&space;\\&space;a_{21}&space;&&space;a_{22}&space;&&space;a_{23}&space;&&space;\cdots&space;&&space;a_{28}&space;\\&space;\vdots&space;&&space;\vdots&space;&&space;\vdots&space;&&space;\ddots&space;&&space;\vdots&space;\\&space;a_{91}&space;&&space;a_{92}&space;&&space;a_{93}&space;&&space;\cdots&space;&&space;a_{98}&space;\\&space;\end{pmatrix}" title="\begin{pmatrix} a_{11} & a_{12} & a_{13} & \cdots & a_{18} \\ a_{21} & a_{22} & a_{23} & \cdots & a_{28} \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ a_{91} & a_{92} & a_{93} & \cdots & a_{98} \\ \end{pmatrix}" /></a>

stored in memory so that *a<sub>ij</sub>* is in location *1000+8i+j*. In memory the matrix therefore  
appears as follows:  

A matrix is said to have a "saddle point" if some position is the smallest value in  
its row and the largest value in its column. In symbols, *a<sub>ij</sub>* is a saddle point if  

Write a *MIX* program that computes the location of a saddle point (if there is at least  
one) or zero (if there is no saddle point), and stops with this value in *rI1*.  
