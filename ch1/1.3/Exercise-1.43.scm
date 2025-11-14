#!/usr/bin/env racket
#lang sicp

(define (repeated f n)
  (define (apply res count)
    (if (= count n)
        res
        (apply (compose f res) (+ count 1))))
  (apply f 1))

(define (compose f g)
  (lambda (x) (f (g x))))

; (lambda (x) (f ((lambda (x) (f x)) x)))
; (lambda (x) (f (f x)))

(define (square x) (* x x))

((repeated square 1) 2)
((repeated square 2) 5)
((repeated square 3) 2)
