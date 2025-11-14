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

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) 
                    (f x) 
                    (f (+ x dx))) 
                 3)))

(define (nf-smooth f n)
  (repeated (smooth f) n))
