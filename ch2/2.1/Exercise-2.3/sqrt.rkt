#!/usr/bin/env racket
#lang sicp

(#%provide sqrt)

(define (iterative-improve good-enough? improve)
  (lambda (x)
    (define (try guess)
      (if (good-enough? guess)
          guess
          (try (improve guess))))
    (try x)))
(define tolerance 0.00001)
(define (fixed-point f initial-guess)
  ((iterative-improve
     (lambda (x) (< (abs (- x (f x))) tolerance))
     f)
   1.0))
(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
(define (square x) (* x x))
(define (sqrt x)
  (newtons-method
    (lambda (y) (- (square y) x)) 1.0))
