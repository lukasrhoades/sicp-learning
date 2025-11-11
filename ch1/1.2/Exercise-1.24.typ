Using the Fermat test (requiring $n$ to pass 10 tests with
randomly generated values of $a < n$, which yields an error rate 
of less than $2^(-10) = 1/256$ for non-Carmichael numbers), 
primes close to $10^10$ can be  calculated, and rapidly so, 
in roughly 4 microseconds?, which is  about 10 times faster than 
the most optimized version of the `smallest-divisor` version.
To make logarithmic behavior easier to detect, the Fermat test is 
applied 100 times to each $n$:
#let primes1 = (12, 12, 12, 12, 12, 12, 11, 12, 13).sum() / 9
#let primes2 = (14, 15, 15, 15, 19, 18, 15, 19, 18).sum() / 9
#let diff1 = primes2 - primes1
#let primes3 = (17, 18, 18, 20, 20, 21, 20, 20, 20).sum() / 9
#let diff2 = primes3 - primes2
#let primes4 = (37, 20, 21, 36, 22, 23, 37, 23, 31).sum() / 9
#let diff3 = primes4 - primes3
#let primes5 = (24, 26, 33, 27, 29, 29, 27, 29, 36).sum() / 9
#let diff4 = primes5 - primes4
#let primes6 = (33, 33, 33, 34, 34, 33, 33, 33, 33).sum() / 9
#let diff5 = primes6 - primes5
#let primes7 = (42, 35, 36, 36, 35, 36, 37, 50, 43).sum() / 9
#let diff6 = primes7 - primes6
#align(center)[#table(
  columns: 3,
  [*Prime*], [*Average Time to Pass 100 Fermat Tests*], [*Difference*],
  [$10^3$], [#calc.round(primes1, digits: 3)], [N/A],
  [$10^4$], [#calc.round(primes2, digits: 3)], [#calc.round(diff1, digits: 3)],
  [$10^5$], [#calc.round(primes3, digits: 3)], [#calc.round(diff2, digits: 3)],
  [$10^6$], [#calc.round(primes4, digits: 3)], [#calc.round(diff3, digits: 3)],
  [$10^7$], [#calc.round(primes5, digits: 3)], [#calc.round(diff4, digits: 3)],
  [$10^8$], [#calc.round(primes6, digits: 3)], [#calc.round(diff5, digits: 3)],
  [$10^9$], [#calc.round(primes7, digits: 3)], [#calc.round(diff6, digits: 3)],
)]
The average time seems to grow at a somewhat constant rate, despite
the input size ($n$) increasing tenfold, which would support the
claim that the Fermat test has $Theta(log n)$ growth.

Let's also use this data to answer the specific question that this
exercise posed. Since the Fermat test has $Theta(log n)$ growth,
we would expect the time to test primes near 1,000,000 to be twice 
as much as the time to test primes near 1,000.
$
(log (10^6)) / log(10^3) = 6 / 3 = 2
$
#let x = calc.round(primes1, digits: 3)
#let y = calc.round(primes4, digits: 3)
#let z = y / x
Using the values from above, the average time at $10^3$ is exactly 
#x and the average time at $10^6$ is approximately #y. The time to
test primes at $10^6$ is $#y / #x approx #calc.round(z, digits: 3)$
times slower than at $10^3$, which is close to the 2 times difference
we expected.

Note: `random` does not work for numbers bigger than $2^32$, so
so numbers higher than $10^9$ cannot be tested.

