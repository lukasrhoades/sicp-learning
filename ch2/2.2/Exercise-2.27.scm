#!/usr/bin/env racket
#lang sicp

(define (deep-reverse x)
  ; for each level reverse car and cdr
  (if (pair? x)
      (reverse (cons (deep-reverse (car x))
                     (deep-reverse (cdr x))))
      x))

(define (reverse items)
  (define (iter a res)
    (if (null? a)
        res
        (iter (cdr a) (cons (car a) res))))
  (iter items nil))

(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)
