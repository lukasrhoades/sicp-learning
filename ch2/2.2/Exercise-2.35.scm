#!/usr/bin/env racket
#lang sicp

(define (count-leaves t)
  (accumulate
    +
    0
    (map
      (lambda (x)
        (cond ((null? x) 0)
              ((not (pair? x)) 1)
              (else (count-leaves x))))
      t)))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (map proc sequence)
  (accumulate (lambda (x y) (cons (proc x) y)) nil sequence))

(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves (list x x))

(define y (list 1 (list 2 (list 3 4)) 5))
(count-leaves y)
(count-leaves (list x y))
