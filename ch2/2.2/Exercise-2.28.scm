#!/usr/bin/env racket
#lang sicp

(define (fringe x)
  (cond ((null? x) x)
        ((not (pair? (car x)))
         (cons (car x) (fringe (cdr x))))
        (else (append (fringe (car x)) (fringe (cdr x))))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
(fringe (list 1 (list 2 (list 3 4))))
