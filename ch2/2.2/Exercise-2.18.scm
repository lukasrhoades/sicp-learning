#!/usr/bin/env racket
#lang sicp

(define (reverse items)
  (define (reverse-iter a res)
    (if (null? a)
        res
        (reverse-iter (cdr a) (cons (car a) res))))
  (reverse-iter items nil))
(reverse (list 1 4 9 16 25))
