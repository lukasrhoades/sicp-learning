With Louis's procedures installed, if `apply-generic` is called
with two arguments of the same type and an operation is not found
in the table for those types, it will try to coerce each argument
to its same type, and then call `apply-generic` with the same
arguments again in the `t1->t2` condition, resulting in an endless
loop. The lack of coercing to the same type exists for a reason,
because this will result in `t1->t2` and `t2->t1` yielding nothing
and an error to be returned indicating there is no method for these
types.

For the specific example of exponentiation, if we call `exp` with
two complex numbers as arguments, then `proc` (in apply-generic)
will be false, since there is no `exp` operation in the dispatch table 
for complex numbers. Because there are two arguments, `get-coercion` 
is called and Louis's procedures result in both `t1->t2` and `t2->t1` 
being true. This means that the `t1->t2` consequent is evaluated, 
which calls generic on the same arguments as originally, resulting in
an infinite loop.
