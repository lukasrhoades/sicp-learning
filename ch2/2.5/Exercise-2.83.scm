#!/usr/bin/env racket
#lang sicp

(define (raise type-object)
  (apply-generic 'raise type-object))

(define (attach-tag tag contents)
  (cons tag contents))

(define (install-raise-integer)
  (define (raise integer)
    (make-rational integer 1))
  (put 'raise '(integer) raise)
  'done)

(define (install-raise-rational)
  (define (make-rational n d)
    (attach-tag 'rational (cons n d)))
  (define (raise rational)
    (make-real (/ (numer rational) (denom rational))))
  (put 'make 'rational make-rational)
  (put 'raise '(rational) raise)
  'done)

(define (make-rational n d)
  ((get 'make 'rational) n d))

(define (install-raise-real)
  (define (make-real num) (attach-tag 'real num))
  (define (raise real)
    (make-complex-from-real-imag real 0))
  (put 'make 'real make-real)
  (put 'raise '(real) raise)
  'done)

(define (make-real num)
  ((get 'make 'real) num))

(define (install-complex-constructor)
  (define (make-complex-from-real-imag x y)
    (attach-tag 'complex (cons x y)))
  (put 'make-from-real-imag 'complex make-complex-from-real-imag)
  'done)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
