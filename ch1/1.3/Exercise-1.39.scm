#!/usr/bin/env racket
#lang sicp

(define (cont-frac n d k)
  (define (cf-iter res k)
    (if (= k 0)
        res
        (cf-iter (/ (n k) (- (d k) res)) (- k 1))))
  (cf-iter 0 k))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (* x x)))
             (lambda (i) (+ i (- i 1)))
             k))

(tan-cf 1.0 5)

; tan(1.0) is approx 1.5574
