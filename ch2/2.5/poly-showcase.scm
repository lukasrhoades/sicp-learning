#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

(define make-term list)

(define p1
  (make-poly-sparse
    'x
    (list (make-term 2 3)
          (make-term 1
                     (make-complex-from-real-imag 2 3))
          (make-term 0 7))))
(define p2
  (make-poly-sparse
    'x
    (list (make-term 4 1)
          (make-term 2
                     (make-rational 2 3))
          (make-term 0
                     (make-complex-from-real-imag 5 3)))))

(mul p1 p2)
