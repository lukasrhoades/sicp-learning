#!/usr/bin/env racket
#lang sicp

(define (adjoin-set x set)
  (cond ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        ((> x (car set)) (cons (car set)
                               (adjoin-set x (cdr set))))))

(adjoin-set 1 '(1 2 3))
(adjoin-set 3 '(1 2 4 5))
(adjoin-set 2 '(4 5 8 9 12))
