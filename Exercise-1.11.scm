#!/usr/bin/env racket
#lang sicp

(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))
(f-recur 0)
(f-recur 1)
(f-recur 2)
(f-recur 3)
(f-recur 4)
(f-recur 5)

(define (f-iter n)
  (define (iter a b c count)
    (if (< count 1)
        c
        (iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (iter 2 1 0 n))
(f-iter 0)
(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
