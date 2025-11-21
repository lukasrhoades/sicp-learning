#!/usr/bin/env racket
#lang sicp

(define (same-parity x . y)
  (define (iter a parity res)
    (cond ((null? a) res)
          ((parity (car a))
           (iter (cdr a) parity (cons (car a) res)))
          (else (iter (cdr a) parity res))))
  (let ((init (cons x nil))
        (odd? (lambda (x) (not (even? x)))))
    (if (even? x)
        (reverse (iter y even? init))
        (reverse (iter y odd? init)))))
(define (even? x)
  (= (remainder x 2) 0))
(define (reverse items)
  (define (iter a res)
    (if (null? a)
        res
        (iter (cdr a) (cons (car a) res))))
  (iter items nil))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)

