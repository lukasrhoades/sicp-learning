#!/usr/bin/env racket
#lang sicp

(define (square x) (* x x))
(define (>= x y) (not (< x y)))
(define (sum-squares-larger x y z)
  (cond ((and (>= x z) (>= y z)) (+ (square x) (square y)))
        ((and (>= x y) (>= z y)) (+ (square x) (square z)))
        (else (+ (square y) (square z)))))
        
(sum-squares-larger 1 2 3)
(sum-squares-larger 1 3 2)
(sum-squares-larger 2 1 3)
(sum-squares-larger 2 3 1)
(sum-squares-larger 3 1 2)
(sum-squares-larger 3 2 1)

(sum-squares-larger 1 1 1)

(sum-squares-larger 1 1 2)
(sum-squares-larger 1 2 1)
(sum-squares-larger 2 1 1)

