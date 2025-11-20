#!/usr/bin/env racket
#lang sicp

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define int1 (make-interval 3 5))
(define int2 (make-interval 1 3))
(sub-interval int1 int2)
