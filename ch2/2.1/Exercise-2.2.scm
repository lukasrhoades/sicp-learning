#!/usr/bin/env racket
#lang sicp

(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (average x y) (/ (+ x y) 2))
(define (midpoint seg)
  (make-point
    (average (x-point (start-segment seg))
             (x-point (end-segment seg)))
    (average (y-point (start-segment seg))
             (y-point (end-segment seg)))))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define line
  (make-segment
    (make-point 0 0)
    (make-point 2 4)))
(print-point (midpoint line))
