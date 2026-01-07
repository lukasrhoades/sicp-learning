#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

;(define (pseudoremainder-terms a b)
;  (let ((c (coeff (first-term b)))
;        (O1 (order (first-term a)))
;        (O2 (order (first-term b))))
;    (let ((integerizing-factor (expt c (+ 1 (- O1 O2)))))
;      (cadr (div-terms
;              (attach-tag
;                (type-tag a)
;                (map
;                  (lambda (term) (make-term
;                                   (order term)
;                                   (* integerizing-factor (coeff term))))
;                  (contents a)))
;              b)))))

;(define (gcd-terms a b)
;  (if (empty-termlist? b)
;      (reduce-coeff a)
;      (gcd-terms b (pseudoremainder-terms a b))))
;(define (reduce-coeff term-list)
;  (define (get-coeff)
;    (accumulate
;      (lambda (x y) (cons (coeff x) y))
;      '()
;      (contents term-list)))
;  (let ((coeff-gcd (apply gcd (get-coeff))))
;    (attach-tag
;      (type-tag term-list)
;      (map (lambda (term)
;             (make-term (order term)
;                        (/ (coeff term) coeff-gcd)))
;           (contents term-list)))))
;(define (accumulate op init seq)
;  (if (null? seq)
;      init
;      (op (car seq)
;          (accumulate op init (cdr seq)))))

(define p1
  (make-poly-sparse
    'x
    '((2 1) (1 -2) (0 1))))
(define p2
  (make-poly-sparse
    'x
    '((2 11) (0 7))))
(define p3
  (make-poly-sparse
    'x
    '((1 13) (0 5))))

(define q1 (mul p1 p2))
(define q2 (mul p1 p3))

(greatest-common-divisor q1 q2)
