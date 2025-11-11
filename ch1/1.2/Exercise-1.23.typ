The expectation that the modification would run twice as fast is
not entirely confirmed, with the runtime for the primes being a
bit over half of what it was before. Were it truly twice as fast,
we would expect an improvement of around 2.00 below, 
where 3 runs of testing the 3 lowest primes after the number listed 
in the *Prime* column were averaged below for both the old and new 
version of `smallest divisor`.
#let old1 = (63, 77, 63, 63, 89, 72, 62, 84, 71).sum() / 9
#let new1 = (49, 48, 40, 46, 47, 39, 44, 48, 40).sum() / 9
#let ratio1 = old1 / new1
#let old2 = (240, 236, 243, 215, 250, 238, 213, 254, 240).sum() / 9
#let new2 = (158, 140, 149, 146, 129, 148, 134, 128, 152).sum() / 9
#let ratio2 = old2 / new2
#let old3 = (719, 725, 770, 719, 716, 706, 712, 718, 774).sum() / 9
#let new3 = (411, 422, 413, 421, 422, 396, 425, 406, 424).sum() / 9
#let ratio3 = old3 / new3
#align(center)[#table(
  columns: 4,
  [*Prime*], [*Old*], [*New*], [*Improvement*],
  [$10^10$], [#calc.round(old1, digits: 3)], [#calc.round(new1, digits: 3)], [#calc.round(ratio1, digits: 3)],
  [$10^11$], [#calc.round(old2, digits: 3)], [#calc.round(new2, digits: 3)], [#calc.round(ratio2, digits: 3)],
  [$10^12$], [#calc.round(old3, digits: 3)], [#calc.round(new3, digits: 3)], [#calc.round(ratio3, digits: 3)],
)]
The reason that the observed ratio is different from 2 is because
the number of steps is not exactly half of what it was before.
In fact, is was greater than half, which is why the runs were
slower than expected.
This is because we added an extra procedure call (`next`),
which itself included an `if` procedure and resulting predicate 
(`= n 2`), all of which are repeated for each `test-divisor`.

Stripping the procedure call and placing the if statement directly
in the `else` clause improves marginally for all but $10^12$, 
where it is about the same.
#let nocall1 = (35, 48, 35, 35, 51, 40, 35, 52, 41).sum() / 9
#let nocall2 = (124, 127, 136, 134, 128, 144, 135, 129, 148).sum() / 9
#let nocall3 = (423, 412, 411, 416, 413, 404, 446, 431, 391).sum() / 9
#let newratio1 = old1 / nocall1
#let newratio2 = old2 / nocall2
#let newratio3 = old3 / nocall3
#align(center)[#table(
  columns: 4,
  [*Prime*], [*Old*], [*Remove `else` Call*], [*Improvement*],
  [$10^10$], [#calc.round(old1, digits: 3)], [#calc.round(nocall1, digits: 3)], [#calc.round(newratio1, digits: 3)],
  [$10^11$], [#calc.round(old2, digits: 3)], [#calc.round(nocall2, digits: 3)], [#calc.round(newratio2, digits: 3)],
  [$10^12$], [#calc.round(old3, digits: 3)], [#calc.round(nocall3, digits: 3)], [#calc.round(newratio3, digits: 3)],
)]

What if we only test whether the `test-divisor` is equal to 2
once? This would greatly reduce the number of unnecessary predicate
evaluations, because once we have a `test-divisor` greater than 2,
it will never be equal to 2 for the remainder of that `n`, since
`test-divisor` can only be increased by the `smallest-divisor`
procedure.
To implement this, the first time we will call `find-divisor` which
will check if the initial test-divisor, 2, is greater than `n` when
it is squared (4), and whether or not 2 (and thus any even number)
divides `n`. If neither of these are the case, `find-divisor-odds`
will be called which no longer has to check if `test-divisor` equals 2. 
#let improve1 = (33, 47, 41, 33, 46, 39, 32, 46, 40).sum() / 9
#let improve2 = (128, 115, 129, 126, 121, 134, 129, 115, 129).sum() / 9
#let improve3 = (384, 392, 382, 383, 417, 375, 391, 397, 374).sum() / 9
#let lastratio1 = old1 / improve1
#let lastratio2 = old2 / improve2
#let lastratio3 = old3 / improve3
#align(center)[#table(
  columns: 4,
  [*Prime*], [*Old*], [*Check Once*], [*Improvement*],
  [$10^10$], [#calc.round(old1, digits: 3)], [#calc.round(improve1, digits: 3)], [#calc.round(lastratio1, digits: 3)],
  [$10^11$], [#calc.round(old2, digits: 3)], [#calc.round(improve2, digits: 3)], [#calc.round(lastratio2, digits: 3)],
  [$10^12$], [#calc.round(old3, digits: 3)], [#calc.round(improve3, digits: 3)], [#calc.round(lastratio3, digits: 3)],
)]
This finally yields something closer to the 2.000 improvement that
we would expect. 
