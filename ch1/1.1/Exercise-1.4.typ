```
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```
This procedure will first check if b is greater than 0 because the first step of evaluation is to evaluate the operator.
If b > 1, then the if clause evaluates to + which is then applied to the procedure's arguments (values of the operands).
In this case, the values of the operands are a and b, so if b > 0, then the procedure evaluates a + b.
If b is not > 0, then the if clause evaluates to the alternative, -, which is then applied to a and b.
This yields a - b, which is $a + abs(b)$, since b is either negative or 0 and subtracting or adding 0 makes no difference.
