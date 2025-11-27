#!/usr/bin/env racket
#lang sicp

(#%require "pict-lang.rkt")

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(paint (up-split wave 2) "pictures/us-w-2.png")
