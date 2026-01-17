#!/usr/bin/env racket
#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))
; this sets the cdr of each element of x to be the previous x
; starting with a, its cdr is now '()
; then b, its cdr is now (a)
; then c, its cdr is now (a b)
; thus this reverses the list

(define v (list 'a 'b 'c 'd))
(define w (mystery v))
v ; this returns (a), since the cdr of v was set to '()
w ; this returns (d c b a)
