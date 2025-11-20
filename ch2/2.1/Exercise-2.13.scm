#!/usr/bin/env racket
#lang sicp

(#%require "mul-interval.rkt")

(define (make-center-percent center pct-tolerance)
  (make-interval
    (- center (* center (/ pct-tolerance 100.0)))
    (+ center (* center (/ pct-tolerance 100.0)))))

(define (percent interval)
  (let ((c (center interval)))
    (* (/ (- (upper-bound interval) c) c) 100.0)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define int1 (make-interval 15.0 16))
(define int2 (make-interval 5 6))
(percent int1)
(percent int2)
(percent (mul-interval int1 int2))
