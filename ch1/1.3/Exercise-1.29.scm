#!/usr/bin/env racket
#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (numerator-even? x)
    (= (remainder (* x n) 2) 0))
  (define (int-term x)
    (cond ((or (= x 0) (= x b)) (f x))
          ((numerator-even? x) (* 2 (f x)))
          (else (* 4 (f x)))))
  (define (int-next x) (+ x h))
  (* (/ h 3)
     (sum int-term a int-next b)))

(define (cube x) (* x x x))

(integral cube 0 1 100)
(integral cube 0 1 1000)

