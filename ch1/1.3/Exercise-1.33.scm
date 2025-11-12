#!/usr/bin/env racket
#lang sicp

(define (filtered-accumulate combiner null-value filter term a next b)
  (define (filtered-accumulate-iter a result)
    (cond ((> a b) result)
          ((filter a)
           (filtered-accumulate-iter (next a) (combiner result (term a))))
          (else (filtered-accumulate-iter (next a) result))))
  (filtered-accumulate-iter a null-value))

(define (prime? n)
  (define (test-prime times n)
    (cond ((= times 0) true)
          ((fermat-test n) (test-prime (- times 1) n))
          (else false)))
  (test-prime 10 n))
(define (expmod base exp m n)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (mr-test (expmod base (/ exp 2) m n) n))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m n))
          m))))
(define (mr-test root n)
  (if (and (= (remainder (square root) n) 1) 
           (not (or (= root 1) (= root (- n 1)))))
      0
      root))
(define (even? n)
  (= (remainder n 2) 0))
(define (square x) (* x x))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (inc n) (+ n 1))
(define (sum-square-primes a b)
  (filtered-accumulate + 0 prime? square a inc b))
(sum-square-primes 2 10)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)
(define (relative-primes n)
  (define (relative-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 relative-prime? identity 1 inc n))
(relative-primes 10)
