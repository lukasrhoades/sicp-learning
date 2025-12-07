#!/usr/bin/env racket
#lang sicp

(define (equal? a b)
  (cond ((and (not (pair? a))
              (not (pair? b)))
         (eq? a b))
        ((and (pair? a) (pair? b))
         (and (equal? (car a) (car b))
              (equal? (cdr a) (cdr b))))
        (else false)))

(equal? '() '())
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
