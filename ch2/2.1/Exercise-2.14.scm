#!/usr/bin/env racket
#lang sicp

(#%require "mul-interval.rkt")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))

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

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (div-interval x y)
  (if (and (> 0 (lower-bound y)) (< 0 (upper-bound y)))
      (display "Error: attempting to divide by an interval that spans 0")
      (mul-interval
        x
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))

(par1 (make-interval 3 4) (make-interval 4 5))
(par2 (make-interval 3 4) (make-interval 4 5))

(define int1 (make-center-percent 10 1))
(define int2 (make-center-percent 5 1))
(div-interval int1 int1)
(div-interval int1 (make-interval 1 1))
int1
int2
(div-interval int1 int2)
