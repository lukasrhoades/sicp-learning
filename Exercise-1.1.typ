```
10
```
_10_

```
(+ 5 3 4)
```
_12_

```
(- 9 1)
```
_8_

```
(/ 6 2)
```
_3_

```
(+ (* 2 4) (- 4 6))
```
_6_

```
(define a 3)
(define b (+ a 1))
```
Therefore b is 4.

```
(+ a b (* a b))
(+ 3 4 12)
```
_19_

```
(= a b)
#f
```

```
(if (and (> b a) (< b (* a b)))
    b
    a)
```
First operand in `and` clause is true because 4 > 3, second is true because 4 < 12. #linebreak()
_4_

```
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
```
First predicate is false, 3 does not equal 4. #linebreak()
Second predicate is true, 4 equals 4. #linebreak()
_16_

```
(+ 2 (if (> b a) b a))
4 > 3, so (+ 2 b)
```
_6_

```
(* cond ((> a b) a)
        ((< a b) b)
        (else -1))
   (+ a 1))
```
First predicate in conditional is false, 3 is not less than 4. #linebreak()
Second predicate in conditional is true, 3 is less than 4.
```
(* 4 (+ a 1))
(* 4 4)
```
_16_
