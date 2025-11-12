#!/usr/bin/env racket
#lang sicp

(define (cont-frac n d k)
  (define (cf-iter res k)
    (if (= k 0)
        res
        (cf-iter (/ (n k) (+ res (d k))) (- k 1))))
  (cf-iter 0 k))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 
             (cond ((= i 2) 2)
                   ((= (remainder (- i 2) 3) 0) (- i (/ (- i 2) 3)))
                   (else 1)))
           10)

; e - 2 is approx 0.71828
