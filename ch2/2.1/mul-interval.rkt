#!/usr/bin/env racket
#lang sicp

(#%provide mul-interval)

(define (mul-interval x y)
  (cond ((and (>= (lower-bound x) 0) (> (lower-bound y) 0))
         (make-interval
           (* (lower-bound x) (lower-bound y))
           (* (upper-bound x) (upper-bound y))))
        ((and (>= (lower-bound x) 0)
              (< (lower-bound y) 0)
              (>= (upper-bound y) 0))
         (make-interval
           (* (upper-bound x) (lower-bound y))
           (* (upper-bound x) (upper-bound y))))
        ((and (>= (lower-bound x) 0) (< (upper-bound y) 0))
         (make-interval
           (* (upper-bound x) (lower-bound y))
           (* (lower-bound x) (upper-bound y))))
        ((and (< (upper-bound x) 0) (< (upper-bound y) 0))
         (make-interval
           (* (upper-bound x) (upper-bound y))
           (* (lower-bound x) (lower-bound y))))
        ((and (< (upper-bound x) 0)
              (< (lower-bound y) 0)
              (>= (upper-bound y) 0))
         (make-interval
           (* (lower-bound x) (upper-bound y))
           (* (lower-bound x) (lower-bound y))))
        ((< (upper-bound x) 0)
         (make-interval
           (* (lower-bound x) (upper-bound y))
           (* (upper-bound x) (lower-bound y))))
        ((>= (lower-bound y) 0)
         (make-interval
           (* (lower-bound x) (upper-bound y))
           (* (upper-bound x) (upper-bound y))))
        ((< (upper-bound y) 0)
         (make-interval
           (* (upper-bound x) (lower-bound y))
           (* (lower-bound x) (lower-bound y))))
        ((and (< (lower-bound y) 0) (>= (upper-bound y) 0))
         (let ((p1 (* (upper-bound x) (lower-bound y)))
               (p2 (* (lower-bound x) (upper-bound y)))
               (p3 (* (lower-bound x) (lower-bound y)))
               (p4 (* (upper-bound x) (upper-bound y))))
           (make-interval
             (min p1 p2)
             (max p3 p4))))))

(define (>= a b) (not (< a b)))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
