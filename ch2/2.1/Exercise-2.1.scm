#!/usr/bin/env racket
#lang sicp

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((n (/ n g))
          (d (/ d g)))
      (if (or (and (> n 0) (< d 0))
              (and (< n 0) (< d 0)))
          (cons (- n) (- d))
          (cons n d)))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat
    (+ (* (numer x) (denom y))
       (* (numer y) (denom x)))
    (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat
    (- (* (numer x) (denom y))
       (* (numer y) (denom x)))
    (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat
    (* (numer x) (numer y))
    (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat
    (* (numer x) (denom y))
    (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define rat1 (make-rat 3 -6))
(print-rat rat1)
(define rat2 (make-rat -27 -81))
(print-rat rat2)

(print-rat (add-rat rat1 rat2))
(print-rat (sub-rat rat1 rat2))
(print-rat (mul-rat rat1 rat2))
(print-rat (div-rat rat1 rat2))
(equal-rat? rat1 rat2)

(define rat3 (make-rat 1 3))
(equal-rat? rat2 rat3)
