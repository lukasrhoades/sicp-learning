#!/usr/bin/env racket
#lang sicp

(define (* a b)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ (* a (- b 1)) a))))

(* 3 4)
(* 14 21)
(* 123 456)
