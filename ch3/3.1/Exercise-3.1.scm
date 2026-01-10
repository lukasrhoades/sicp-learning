#!/usr/bin/env racket
#lang sicp

(define (make-accumulator sum)
  (lambda (num)
    (set! sum (+ sum num))
    sum))

(define A (make-accumulator 5))
(A 10)
(A 10)
