#!/usr/bin/env racket
#lang sicp

(#%require "dispatch.rkt")
(#%require "general-arithmetic.rkt")

(define (adjoin-term term term-list)
  ((get 'adjoin-term (type-tag term-list)) term (contents term-list)))
(define make-term list)

;(define (div-poly p1 p2)
;  (if (same-variable? (variable p1) (variable p2))
;      (make-poly (variable p1)
;                 (div-terms (term-list p1) (term-list p2)))
;      (error "Polys not in same var: DIV-POLY" (list p1 p2))))
;
;(define (div-terms L1 L2)
;  (if (empty-termlist? L1)
;      (list (the-empty-termlist) (the-empty-termlist))
;      (let ((t1 (first-term L1))
;            (t2 (first-term L2)))
;        (if (> (order t2) (order t1))
;            (list (the-empty-termlist) L1)
;            (let ((new-c (div (coeff t1) (coeff t2)))
;                  (new-o (- (order t1) (order t2))))
;              (let ((rest-of-result
;                      (div-terms
;                        (contents
;                          (term-list
;                            (sub
;                              (make-polynomial 'x L1)
;                              (make-polynomial
;                                'x
;                                (mul-terms
;                                  (adjoin-term
;                                    (make-term new-o new-c)
;                                    (cons (type-tag L2) (the-empty-termlist)))
;                                  L2)))))
;                          L2)))
;                (list
;                  (adjoin-term (make-term new-o new-c)
;                               (car rest-of-result))
;                  (cadr rest-of-result))))))))

(define dividend
  (make-polynomial
    'x
    (adjoin-term (make-term 5 1)
                 (adjoin-term (make-term 0 -1)
                              (cons 'dense '())))))

(define divisor
  (make-polynomial
    'x
    (adjoin-term (make-term 2 1)
                 (adjoin-term (make-term 0 -1)
                              (cons 'dense '())))))

(div dividend divisor)
