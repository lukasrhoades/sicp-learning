#!/usr/bin/env racket
#lang sicp

(#%require "pict-lang.rkt")

(define (split op1 op2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split op1 op2) painter (- n 1))))
          (op1 painter (op2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split wave 4) "pictures/rs-w-4.png")
(paint (up-split wave 4) "pictures/us-w-4.png")
