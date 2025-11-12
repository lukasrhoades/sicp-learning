```
(define (f g) (g 2))
```
If we ask the interpreter to evaluate the combination (`f f`), then
the interpreter will attempt to evaluate (`f 2`), which evaluates to
(`2 2`), which the interpreter is unable to evaluate because `2` 
is not a procedure.
