#!/usr/bin/env racket
#lang sicp

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) ((n f) x))))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (add a b) 
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define inc (lambda (x) (+ x 1)))
((zero inc) 0)
((one inc) 0)
((two inc) 0)
(((add one two) inc) 0)
