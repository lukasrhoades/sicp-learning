We can represent a pair of nonnegative integers, $a$ and $b$,
with the integer that is the product $2^a 3^b$. This is because
we can always extract $a$ or $b$ by dividing by the base of the
other exponent (so 3 if looking for $a$ or 2 if looking for $b$) 
until it is no longer possible (to get an integer, meaning the 
number modulo 3 is not 0), at which point $2^a$ or $3^b$ remains. 
From this point, take the logarithm 
#footnote[This can be done without a `log` primitive by 
multiplying the base over and over again until the integer is 
reached; the value is the number of multiplications performed.] 
of the base (2 for $a$ and 3 for $b$) to recover $a$ or $b$. 
 
