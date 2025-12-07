```
(car ''abracadabra)
(car (quote 'abracadabra))
(car (quote (quote abracadabra)))
(car '(quote abracadabra))
```
This prints `quote` because `'` wraps the next complete
expression (in this case `'abracadabra`) with `quote`, thus forming
a list for `car` to operate on and extract `quote` as seen above.
