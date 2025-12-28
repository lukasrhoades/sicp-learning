#!/usr/bin/env racket
#lang sicp

(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          ((eq? op 'real-part)
           (* r (cos a)))
          ((eq? op 'imag-part)
           (* r (sin a)))
          (else (error "Unknown op: MAKE-FROM-MAG-AANG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))
(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))

(define test (make-from-mag-ang 5 (atan 4 3)))
(magnitude test)
(angle test)
(real-part test)
(imag-part test)
