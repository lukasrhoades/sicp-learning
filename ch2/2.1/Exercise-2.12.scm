#!/usr/bin/env racket
#lang sicp

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

(make-center-percent 3.5 4)
(percent (make-interval 3.35 3.65))
