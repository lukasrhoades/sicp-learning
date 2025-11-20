#!/usr/bin/env racket
#lang sicp

(define (cons a b)
  (* (exp 2 a) (exp 3 b)))
(define (car-old x)
  ; divide by 3 until no longer divisible by 3
  ; find log base 2 of remaining number
  (define (iter x)
    (if (divis-by-3? x)
        (iter (/ x 3))
        (log 2 x)))
  (iter x))
(define (divis-by-3? x)
  (= (remainder x 3) 0))
(define (iter x divide-by log-base)
    (if (= (remainder x divide-by) 0)
        (iter (/ x divide-by) divide-by log-base)
        (log log-base x)))
(define (car x)
  (iter x 3 2))
(define (cdr x)
  (iter x 2 3))

(define (log base x)
  (define (iter x res)
    (if (= (remainder x base) 0)
        (iter (/ x base) (+ res 1))
        res))
  (iter x 0))

(define (exp base power)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((is-even? n)
           (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 base power))
(define (is-even? n)
  (= (remainder n 2) 0))
(define (square x) (* x x))

(car (cons 4 5))
(cdr (cons 4 5))

