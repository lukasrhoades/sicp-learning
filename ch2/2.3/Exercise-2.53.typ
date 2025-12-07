```
(list 'a 'b 'c)
```
_`(a b c)`_

```
(list (list 'george))
```
_`((george))`_

```
(cdr '((x1 x2) (y1 y2)))
```
This constructs a list, not a pair. #linebreak()
_`((y1 y2))`_

```
(cadr '((x1 x2) (y1 y2)))
```
_`(y1 y2)`_

```
(pair? (car '(a short list)))
(pair? a)
```
_`#f`_

```
(memq 'red '((red shoes) (blue socks)))
```
_`#f`_

```
(memq 'red '(red shoes blue socks))
```
_`(red shoes blue socks)`_
