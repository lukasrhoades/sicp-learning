#lang sicp

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs 10)
(abs 0)
(abs -10)

(define (abs-2 x)
  (cond ((< x 0) (- x))
        (else x)))
(abs-2 10)
(abs-2 0)
(abs-2 -10)

(define (abs-3 x)
  (if (< x 0)
      (- x)
      x))
(abs-3 10)
(abs-3 0)
(abs-3 -10)

(define (>= x y) (or (> x y) (= x y)))
(>= 2 3)
(>= 3 3)
(>= 4 3)