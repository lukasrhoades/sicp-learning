#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

; can represent complex numbers whose parts can be
; ordinary numbers or rational numbers

; we can already define them no problem
(define test1
  (make-complex-from-real-imag
    (make-rational 1 2)
    (make-rational 3 2)))

; and access the individual parts through complex package
; this works because complex package uses generic operations
; to access the parts
(real-part test1)
(imag-part test1)

; except when calculating parts we don't specify...
; we need to make the operations generic
; for example, can't use * on rational numbers
; square now uses mul instead of *

; work at the level of rectangular/polar package

; define a generic square root 
(define (sqrt x) (apply-generic 'sqrt x))
(define (sqrt-scheme x) (make-real (sqrt x)))
(define (sqrt-rat x)
  (make-rational (sqrt (numer x)) (sqrt (denom x))))

; generic cosine
(define (cosine x) (apply-generic 'cosine x))
(define (cosine-scheme x) (make-real (cos x)))
(define (cosine-rat x)
  (make-real (cos (/ (numer x) (denom x)))))

; generic sine
(define (sine x) (apply-generic 'sine x))
(define (sine-scheme x) (make-real (sin x)))
(define (sine-rat x)
  (make-real (sin (/ (numer x) (denom x)))))

; generic arctan
(define (arctan x y) (apply-generic 'arctan x y))
(define (arctan-scheme x y) (make-real (atan x y)))
(define (arctan-rat x y)
  (make-real (atan (/ (numer x) (denom x))
                   (/ (numer y) (denom y)))))

(magnitude test1)
(angle test1)

(define test2
  (make-complex-from-mag-ang
    (make-rational 3 4)
    (make-rational 1 2)))

(magnitude test2)
(angle test2)
(real-part test2)
(imag-part test2)

; substituting operators to complex package allows this
(add test1 test1)
(add test2 test2)

(define test3 (add test1 test2))
test3
(sub test3 test2)
test1

(mul test1 test2)
(div test1 test2)
