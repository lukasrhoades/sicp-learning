#!/usr/bin/env racket
#lang sicp

(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
        result
        (accumulate-iter (next a) (combiner result (term a)))))
  (accumulate-iter a null-value))

(define (identity x) x)
(define (inc n) (+ n 1))
(define (sum a b)
  (accumulate + 0 identity a inc b))

(define (product a b)
  (accumulate * 1 identity a inc b))

(sum 1 10)
(product 1 6)
                  
