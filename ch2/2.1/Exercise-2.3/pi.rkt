#!/usr/bin/env racket
#lang sicp

(#%provide pi)

(define (sum term a next b)
  (define (sum-iter a result)
    (if (> a b)
        result
        (sum-iter (next a) (+ result (term a)))))
  (sum-iter a 0))

(define (pi-sum a b)
  (sum
    (lambda (x) (/ 1.0 (* x (+ x 2))))
    a
    (lambda (x) (+ x 4))
    b))

(define pi (* 8 (pi-sum 1 1000000)))
