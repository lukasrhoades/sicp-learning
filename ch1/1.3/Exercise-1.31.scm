#!/usr/bin/env racket
#lang sicp

(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recur term (next a) next b))))
(define (product term a next b)
  (define (product-iter a result)
    (if (> a b)
        result
        (product-iter (next a) (* result (term a)))))
  (product-iter a 1))

(define (identity x) x)
(define (inc n) (+ n 1))
(define (factorial-recur n)
  (product-recur identity 1 inc n))
(define (factorial-iter n)
  (product identity 1 inc n))

(factorial-recur 6)
(factorial-iter 6)

(define (even? n)
  (= (remainder n 2) 0))
(define (pi-term x)
  (if (even? x)
      (/ (+ x 2)
         (+ (- x 1) 2))
      (/ (+ x 1.0)
         (+ x 2))))
(define (pi-approx-recur a b)
  (product-recur pi-term a inc b))
(define (pi-approx-iter a b)
  (product pi-term a inc b))

(* 4 (pi-approx-recur 1 1000))
(* 4 (pi-approx-iter 1 1000))
