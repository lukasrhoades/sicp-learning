#!/usr/bin/env racket
#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define l `(a b c))
(count-pairs l)

(define x '(b))
(define y (cons 'a x))
(count-pairs (cons y x))

(define z (cons x x))
(count-pairs (cons z z))

(set-cdr! (cddr l) l)
;(count-pairs l) ; infinite loop
