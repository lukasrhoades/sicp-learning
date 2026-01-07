#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

;(define (gcd a b)
;  (if (= b 0)
;      a
;      (gcd b (remainder a b))))

;(define (gcd-terms a b)
;  (if (empty-termlist? b)
;      a
;      (gcd-terms b (remainder-terms a b))))

;(define (remainder-terms a b)
;  (cadr (div-terms a b)))

;(define (gcd-poly p1 p2)
;  (if (same-variable? (variable p1) (variable p2))
;      (gcd-terms (term-list p1) (term-list p2))
;      (error "Polys not in same var: GCD-POLY" (list p1 p2))))

;(define (greatest-common-divisor x y)
;  (apply-generic 'greatest-common-divisor x y))

;(put 'greatest-common-divisor '(polynomial polynomial) gcd-poly)
;(put 'greatest-common-divisor '(integer integer) gcd)

(define p1
  (make-poly-sparse 'x '((4 1) (3 -1) (2 -2) (1 2))))
(define p2
  (make-poly-sparse 'x '((3 1) (1 -1))))
(greatest-common-divisor p1 p2)
