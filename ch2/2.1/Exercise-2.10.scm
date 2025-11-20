#!/usr/bin/env racket
#lang sicp

(define (div-interval x y)
  (if (and (> 0 (lower-bound y)) (< 0 (upper-bound y)))
      (display "Error: attempting to divide by an interval that spans 0")
      (mul-interval
        x
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define int1 (make-interval 4 8))
(define int2 (make-interval 1 5))
(define int3 (make-interval -3 3))

(div-interval int1 int2)
(div-interval int1 int3)
