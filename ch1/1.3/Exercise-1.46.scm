#!/usr/bin/env racket
#lang sicp

(define (iterative-improve good-enough? improve)
  (lambda (x)
    (define (try guess)
      (if (good-enough? guess)
          guess
          (try (improve guess))))
     (try x)))

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (sqrt x)
  ((iterative-improve
     (lambda (y) (< (abs (- (square y) x)) 0.001))
     (lambda (y) (average y (/ x y))))
   1.0))
(sqrt 9)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (x) (< (abs (- x (f x))) tolerance))
    f)
   first-guess))
(fixed-point cos 1.0)
