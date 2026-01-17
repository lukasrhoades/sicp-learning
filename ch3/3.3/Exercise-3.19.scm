#!/usr/bin/env racket
#lang sicp

(define (contains-cycle? x)
  (define (iter first-call? ptr1 ptr2)
    (cond ((or (null? ptr1) (null? (cdr ptr1))) #f)
          ((and (not first-call?) (eq? ptr1 ptr2)) #t)
          (else (iter #f (cddr ptr1) (cdr ptr2)))))
  (iter #t x x))

(define l `(a b c))
(contains-cycle? l)

(define x '(b))
(define y (cons 'a x))
(contains-cycle? (cons y x))

(define z (cons x x))
(contains-cycle? (cons z z))

(set-cdr! (cddr l) l)
(contains-cycle? l)
