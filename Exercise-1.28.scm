#!/usr/bin/env racket
#lang sicp

(define (test-prime n)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder
            (square (mr-test (expmod base (/ exp 2) m)))
            m))
          (else
           (remainder
            (* base (expmod base (- exp 1) m))
            m))))
  (define (mr-test root)
    (if (and (= (remainder (square root) n) 1) 
             (not (or (= root 1) (= root (- n 1)))))
        0
        root))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (square x) (* x x))
  (define (prime? n)
    (define (try-it a)
      (= (expmod a (- n 1) n) 1))
    (try-it (+ 1 (random (- n 1)))))
  (define (fermat-test a times)
    (cond ((= times 0) (display ": prime"))
          ((prime? n) (fermat-test a (- times 1)))
          (else (display ": not prime"))))
  (display n)
  (fermat-test 2 10)
  (newline))

(test-prime 42)
(test-prime 561)
(test-prime 1009)
(test-prime 1013)
(test-prime 1019)
(test-prime 1105)
(test-prime 1729)
(test-prime 2465)
(test-prime 2821)
(test-prime 6601)
(test-prime 1000000021)

