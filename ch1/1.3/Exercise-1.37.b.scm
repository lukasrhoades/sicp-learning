#!/usr/bin/env racket
#lang sicp

(define (cont-frac n d k)
  (define (cf-recur i)
    (if (= i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i) (cf-recur (+ i 1))))))
  (cf-recur 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(/ 1 (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))


          
          
