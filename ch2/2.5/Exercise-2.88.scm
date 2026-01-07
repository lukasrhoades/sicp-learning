#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

;(define (sub-poly p1 p2)
;  (add p1 (negate p2)))
;(define (neg-poly poly)
;  (define (negate-termlist tl)
;    (if (empty-termlist? tl)
;        (the-empty-termlist)
;        (adjoin-term (make-term (order (first-term tl))
;                                (negate (coeff (first-term tl))))
;                     (negate-termlist (rest-terms tl)))))
;  (make-poly (variable poly) (negate-termlist (term-list poly))))
;
;(put 'sub '(polynomial polynomial) sub-poly)
;(put 'negate '(polynomial) neg-poly)
;(put 'negate '(integer) (lambda (x) (- x)))
;(put 'negate '(rational)
;     (lambda (x) (make-rational (negate (numer x)) (denom x))))
;(put 'negate '(real) (lambda (x) (make-real (- x))))
;(put 'negate '(complex)
;     (lambda (x)
;       (make-complex-from-real-imag
;         (negate (real-part x))
;         (negate (imag-part x)))))

(define test1
  (make-polynomial 'x (cons 'sparse
                            (list (list 3 1) (list 1 0) (list 0 4)))))
(define test2
  (make-polynomial 'x (cons 'sparse
                            (list (list 2 1) (list 1 3) (list 0 1)))))

(sub test1 test2)
