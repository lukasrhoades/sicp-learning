#!/usr/bin/env racket
#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (identity x) x)
(define (inc n) (+ n 1))
(define (sum a b)
  (accumulate + 0 identity a inc b))

(define (product a b)
  (accumulate * 1 identity a inc b))

(sum 1 10)
(product 1 6)
                  
