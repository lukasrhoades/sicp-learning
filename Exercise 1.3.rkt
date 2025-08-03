#lang sicp

(define (sum-squares-larger x y z)
  (cond ((or (and (> x z) (> y z)) (and (> x z) (= y z))) (+ (* x x) (* y y)))
        ((or (and (> x y) (> z y)) (and (> x y) (= y z))) (+ (* x x) (* z z)))
        (else (+ (* y y) (* z z)))))

(sum-squares-larger 1 2 3)
(sum-squares-larger 1 3 2)
(sum-squares-larger 2 1 3)
(sum-squares-larger 2 3 1)
(sum-squares-larger 3 1 2)
(sum-squares-larger 3 2 1)

(sum-squares-larger 1 1 2)
(sum-squares-larger 1 2 1)
(sum-squares-larger 2 1 1)
