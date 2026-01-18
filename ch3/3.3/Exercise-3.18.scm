#!/usr/bin/env racket
#lang sicp

(define (contains-cycle? x)
  (let ((visited '()))
    (define (visited? x)
      (if (memq x visited) #t #f))
    (define (iter x)
      (cond ((null? x) #f)
            ((visited? x) #t)
            (else (set! visited (cons x visited))
                  (iter (cdr x)))))
    (iter x)))

(define l `(a b c))
(contains-cycle? l)

(define x '(b))
(define y (cons 'a x))
(contains-cycle? (cons y x))

(define z (cons x x))
(contains-cycle? (cons z z))

(set-cdr! (cddr l) l)
(contains-cycle? l)
