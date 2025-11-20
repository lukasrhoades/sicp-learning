```
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
```
To verify with the substitution model, write out the steps
for the evaluation of `(car (cons 1 2))`.
```
(car (cons 1 2))
(car (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) p))
((lambda (p q) p) 1 2)
```
_1_ #linebreak()
This representation works because it will apply a procedure
that selects the first of two arguments to the arguments
of `cons`. It does this by applying a procedure that will take its
argument and apply it to the arguments of `cons`.

The corresponding definition of `cdr` is as follows.
```
(define (cdr z)
  (z (lambda (p q) q)))
```
And here is the substitution model for `(cdr (cons 1 2))`.
```
(cdr (cons 1 2))
(cdr (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) q))
((lambda (p q) q) 1 2)
```
_2_
