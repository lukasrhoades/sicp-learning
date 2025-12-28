#!/usr/bin/env racket
#lang sicp

(define (=zero? x) (apply-generic '=zero? x))

(define (install-zero-predicate)
  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0)))
  (put '=zero? '(rational)
       ; cannot divide by 0
       (lambda (x) (= (numer x) 0)))
  (put '=zero? '(complex)
       (lambda (x) (= (magnitude x) 0)))
  'done)
