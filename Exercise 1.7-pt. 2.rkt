#lang sicp

(define (sqrt-iter guess x)
  (if (good-enough? (improve guess x) guess)
          guess
          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess old-guess)
  (< (abs (- guess old-guess)) (* guess 0.001)))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.000001)
(sqrt 1000000000000000)