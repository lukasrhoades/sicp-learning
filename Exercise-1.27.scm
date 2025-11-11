#!/usr/bin/env racket
#lang sicp

(define (test-prime n)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder
            (square (expmod base (/ exp 2) m))
            m))
          (else
           (remainder
            (* base (expmod base (- exp 1) m))
            m))))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (square x) (* x x))
  (define (prime? a)
    (= (expmod a n n) a))
  (define (fermat-test a)
    (cond ((= a n) (display ": prime"))
          ((prime? a) (fermat-test (+ a 1)))
          (else (display ": not prime"))))
  (display n)
  (fermat-test 2)
  (newline))

(test-prime 561)
(test-prime 1105)
(test-prime 1729)
(test-prime 2465)
(test-prime 2821)
(test-prime 6601)

