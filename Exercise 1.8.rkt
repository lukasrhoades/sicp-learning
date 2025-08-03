#lang sicp

(define (cubert-iter guess x)
  (if (good-enough? (improve guess x) guess)
          guess
          (cubert-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))

(define (good-enough? guess old-guess)
  (< (abs (- guess old-guess)) (* guess 0.001)))

(define (cubert x)
  (cubert-iter 1.0 x))

(cubert 8)