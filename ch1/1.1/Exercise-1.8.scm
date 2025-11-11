#!/usr/bin/env racket
#lang sicp

(define (cbrt x)
  (define (cbrt-iter guess)
    (if (good-enough? guess)
      (improve guess)
      (cbrt-iter (improve guess))))
  (define (good-enough? guess)
    (< (/ (abs (- (improve guess) guess))
          guess)
       0.001))
  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))
  (define (square x) (* x x))
  (cbrt-iter 1.0))
(cbrt 8)

