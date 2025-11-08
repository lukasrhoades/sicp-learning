#!/usr/bin/env racket
#lang sicp

(define (fast-exp b n)
  (define (square x) (* x x))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (fast-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-iter a (square b) (/ n 2)))
          (else (fast-iter (* a b) b (- n 1)))))
  (fast-iter 1 b n))

(fast-exp 2 4)
(fast-exp 2 8)
(fast-exp 3 5)
(fast-exp 6 7)
