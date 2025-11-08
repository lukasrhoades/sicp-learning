#!/usr/bin/env racket
#lang sicp

(define (* a b)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (define (add-iter a b n)
    (cond ((= b 0) a)
          ((even? b) (add-iter (double a) (halve b) n))
          (else (add-iter a (- b 1) (+ n a)))))
  (add-iter a b 0))

(* 3 4)
(* 14 21)
(* 123 456)
