#!/usr/bin/env racket
#lang sicp

(#%require "dispatch.rkt")
(#%require "general-arithmetic.rkt")

(define (adjoin-term term term-list)
  ; only the term-list is tagged
  ((get 'adjoin-term (type-tag term-list)) term (contents term-list)))
(define make-term list)

(define dense-test
  (make-polynomial
    'x
    (adjoin-term (make-term 5 1)
                 (adjoin-term (make-term 4 2)
                              (adjoin-term (make-term 2 3)
                                           (adjoin-term (make-term 1 -2)
                                                        (adjoin-term (make-term 0 -5)
                                                                           (cons 'dense '()))))))))

(define sparse-test
  (make-polynomial
    'x
    (adjoin-term (make-term 100 1)
                 (adjoin-term (make-term 2 2)
                              (adjoin-term (make-term 0 1)
                                           (cons 'sparse '()))))))

(add dense-test sparse-test)
(mul dense-test sparse-test)
(sub dense-test sparse-test)
