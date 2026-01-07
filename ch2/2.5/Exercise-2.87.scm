#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

;(define (=zero-poly? poly)
;  (cond ((empty-termlist? (term-list poly)) #t)
;        ((not (=zero? (coeff (first-term (term-list poly))))) #f)
;        (else (=zero-poly? (make-poly
;                             (variable poly)
;                             (rest-terms (term-list poly)))))))
;(put '=zero? '(polynomial) =zero-poly?)

(define (the-empty-termlist) '())
(define (make-term order coeff) (list order coeff))

(=zero? (make-poly-sparse 'x (the-empty-termlist)))
(=zero? (make-poly-sparse 'x (list (make-term 3 0) (make-term 1 0))))
(=zero? (make-poly-sparse 'x (list (make-term 3 1) (make-term 1 0))))
