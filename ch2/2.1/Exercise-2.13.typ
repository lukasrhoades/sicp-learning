Let the endpoints of interval 1 be $a, b$ and the
endpoints of interval 2 be $c, d$. Let $m$ be the center of
interval 1 and $n$ be the center of interval 2. Then, $
m = (a + b) / 2 "and" n = (c + d) / 2.
$ Now let $p$ be the percentage tolerance of interval 1
and $q$ be the percentage tolerance of interval 2. $
p = 100 ((b - (a + b) / 2) / ((a + b) / 2))
"and" q = 100 ((d - (c + d) / 2) / ((c + d) / 2)).
$
This simplifies to:
$
p = 100 ((b - a) / (a + b))
"and" q = 100 ((d - c) / (c + d)).
$
When $a, b, c, d in Z^+$, then the lower bound of the new 
interval formed by the multiplication of interval 1 and 2
is $a c$ and the upper bound is $ b d$. This means that
the new center is $(a c + b d) / 2$ and the new percentage 
tolerance, $r$ is: $
r = 100 ((b d - (a c + b d) / 2) / ((a c + b d) / 2))
=& 100 ((b d - a c) / (a c + b d)).
$
The following reveals how $r$ can be approximated in
terms of $p$ and $q$ given small percentage tolerances. 
The percentage conversion is omitted for brevity and clarity.
$
p + q &= ((b - a) / (a + b)) + ((d - c) / (c + d)) \
&= ((b - a)(c + d) + (d - c)(a + b)) / ((a + b)(c + d)) \
&= (b c + b d - a c - a d + a d + b d - a c - b c)/
(a c + a d + b c + b d) \
&= (2 b d - 2 a c) / (a c + a d + b c + b d) \
&= ((b d - a c) + b d - a c) / ((a c + b d) + b c + b d)
$
If $(b d - a c) / (b c + b d) approx (b d - a c) / (a c + b d)
<==> b c approx a c$, then $p + q$ is a good approximation for $r$. 
This means that $p + q$ is a good approximation when the values of
$a$ and $b$ are similar, which is the case when the percentage
tolerance is small. Therefore, under the assumption of small
percentage tolerances the percentage tolerance of the product
of two intervals can be approximated by the sum of the
tolerances of the factors.

