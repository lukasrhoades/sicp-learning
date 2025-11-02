#let ex1 = calc.pow(0.03, 2)
#let ex2 = ex1 - 0.00001
For very small numbers the `good-enough?` test will become less effective
because the test of a 0.001 absolute difference is fixed for all radicands.
A 0.001 difference is small enough for larger radicands, but as radicands
becomes smaller, a relatively large difference (compared to the radicand) becomes acceptable.
For example, the square root of 0.00001 is approximately 0.003, but when 
`good-enough?` encounters roughly 0.03, it will test the absolute difference
between $0.03^2$, which is #ex1, and the radicand 0.00001.
This difference is #ex2, which is less than 0.001 but results in a square
root that is off by approximately 0.028, a value that is almost 3,000 times
larger than the original radicand.

As seen by the following table, as the radicand gets smaller, the ratio
between the difference in scheme-calculated square root and radicand grows
larger and larger.
#let results1 = (0.316245562280389, 0.10032578510960605, 0.04124542607499115, 0.03230844833048122, 0.03135649010771716, 0.031260655525445276)
#let dict1 = (:)
#for (i, radicand) in (0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001).enumerate() {
  dict1.insert(("rad" + str(i)), radicand)
  dict1.insert(("rslt" + str(i)), results1.at(i))
  let sqrt = calc.sqrt(radicand)
  dict1.insert(("sqrt" + str(i)), sqrt)
  let diff = calc.abs(sqrt - results1.at(i))
  dict1.insert(("diff" + str(i)), diff)
  let ratio = diff / radicand
  dict1.insert(("ratio" + str(i)), ratio)
}

#let table1_data = (
  for i in range(6) {
    let key1 = "rad" + str(i)
    let key2 = "rslt" + str(i)
    let key3 = "sqrt" + str(i)
    let key4 = "diff" + str(i)
    let key5 = "ratio" + str(i)

    (
      [$dict1.at(key1)$],
      [$#calc.round(dict1.at(key2), digits: 14)$],
      [$#calc.round(dict1.at(key3), digits: 14)$],
      [$#calc.round(dict1.at(key4), digits: 14)$],
      [$#calc.round(dict1.at(key5), digits: 14)$],
    )
  }
)

#table(
  columns: 5,
  [*Radicand*], [*sqrt*], [*True Value*], [*Difference*], [*Ratio*],
  ..table1_data
)

#let results2 = (10.000000000139897, 31.622782450701045, 100.00000025490743, 316.2277660203896, 1000.0000000000118, 3162.277660168379, 10000.0, 31622.776601684047, 100000.0, 316227.7660168379, 1000000.0, 0, 0, 0)
#let dict2 = (:)
#let radicands = range(2,16).map(i => calc.pow(10, i))
#for (i, radicand) in radicands.enumerate() {
  dict2.insert(("rad" + str(i)), radicand)
  dict2.insert(("rslt" + str(i)), results2.at(i))
  let sqrt = calc.sqrt(radicand)
  dict2.insert(("sqrt" + str(i)), sqrt)
  dict2.insert(("diff" + str(i)), calc.abs(sqrt - results2.at(i)))
}

For large numbers, this same pattern does not apply. The `good-enough?`
test works well for large-ish numbers, however, once $10^13$ is reached,
there is probably not enough precision for the computer to store the
digits required to pass the test. The interpreter is unable to return
a value for those larger radicands.

#let table2_data = (
  for i in range(14) {
    let key1 = "rad" + str(i)
    let key2 = "rslt" + str(i)
    let key3 = "sqrt" + str(i)
    let key4 = "diff" + str(i)

    (
      [$dict2.at(key1)$],
      [$#calc.round(dict2.at(key2), digits: 14)$],
      [$#calc.round(dict2.at(key3), digits: 14)$],
      [$#calc.round(dict2.at(key4), digits: 14)$],
    )
  }
)

#table(
  columns: 4,
  [*Radicand*], [*sqrt*], [*True Value*], [*Difference*],
  ..table2_data
)

By modifying the `good-enough?` test to instead check whether the absolute difference
between guesses is less than 0.001 times the size of the guess, we can solve
both problems. As seen in the table below, the ratio of the difference is now acceptable
for very small numbers, and the interpreter is also able to give very accurate
square roots for very large numbers.

#let results3 = (0.31622776651756745, 0.10000000000139897, 0.03162278245070105, 0.010000000025490743, 0.0031622776602038957, 0.0010000001533016628)
#let dict3 = (:)
#for (i, radicand) in (0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001).enumerate() {
  dict3.insert(("rad" + str(i)), radicand)
  dict3.insert(("rslt" + str(i)), results3.at(i))
  let sqrt = calc.sqrt(radicand)
  dict3.insert(("sqrt" + str(i)), sqrt)
  let diff = calc.abs(sqrt - results3.at(i))
  dict3.insert(("diff" + str(i)), diff)
  let ratio = diff / radicand
  dict3.insert(("ratio" + str(i)), ratio)
}

#let table1_data = (
  for i in range(6) {
    let key1 = "rad" + str(i)
    let key2 = "rslt" + str(i)
    let key3 = "sqrt" + str(i)
    let key4 = "diff" + str(i)
    let key5 = "ratio" + str(i)

    (
      [$dict3.at(key1)$],
      [$#calc.round(dict3.at(key2), digits: 14)$],
      [$#calc.round(dict3.at(key3), digits: 14)$],
      [$#calc.round(dict3.at(key4), digits: 14)$],
      [$#calc.round(dict3.at(key5), digits: 14)$],
    )
  }
)

#table(
  columns: 5,
  [*Radicand*], [*sqrt*], [*True Value*], [*Difference*], [*Ratio*],
  ..table1_data
)

For the very large numbers ($>10^13$) that the old test didn't work for,
the interpreter can now return a value when the guess stabilizes, even if it
isn't within 0.001, as long as the difference is a low enough ratio (0.001, 
which for numbers this large is permissible even with limited precision).

#let results4 = (10.000000000139897, 31.622782450701045, 100.00000025490743, 316.2277660203896, 1000.0001533016629, 3162.277666486375, 10000.000000082462, 31622.780588899368, 100000.00015603233, 316227.7660187454, 1000000.103461242, 3162277.6640104805, 10000000.000043957, 31622779.27999515)
#let dict4 = (:)
#let radicands = range(2,16).map(i => calc.pow(10, i))
#for (i, radicand) in radicands.enumerate() {
  dict4.insert(("rad" + str(i)), radicand)
  dict4.insert(("rslt" + str(i)), results4.at(i))
  let sqrt = calc.sqrt(radicand)
  dict4.insert(("sqrt" + str(i)), sqrt)
  dict4.insert(("diff" + str(i)), calc.abs(sqrt - results4.at(i)))
}

#let table2_data = (
  for i in range(14) {
    let key1 = "rad" + str(i)
    let key2 = "rslt" + str(i)
    let key3 = "sqrt" + str(i)
    let key4 = "diff" + str(i)

    (
      [$dict4.at(key1)$],
      [$#calc.round(dict4.at(key2), digits: 14)$],
      [$#calc.round(dict4.at(key3), digits: 14)$],
      [$#calc.round(dict4.at(key4), digits: 14)$],
    )
  }
)

#table(
  columns: 4,
  [*Radicand*], [*sqrt*], [*True Value*], [*Difference*],
  ..table2_data
)
