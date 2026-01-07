#!/usr/bin/env racket
#lang sicp

(#%require "dispatch.rkt")
(#%require "general-arithmetic.rkt")

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (try-coerce op type-tags args)))))

(define (try-coerce op types args)
  (if (null? types)
      (error "No method for these types"
             (list op types))
      (let ((coerce-attempt (coerce-all (car types) args)))
        (if (= (length coerce-attempt) (length args))
            (apply apply-generic (cons op coerce-attempt))
            (try-coerce op (cdr types) args)))))

; returns list of new args, so use apply in try-coerce
(define (coerce-all target-type args)
  (if (null? args)
      '()
      (if (eq? (type-tag (car args)) target-type)
          (cons (car args) (coerce-all target-type (cdr args)))
          (let ((attempt-coerce
                  (get-coercion (type-tag (car args)) target-type)))
            (if attempt-coerce
                (cons (attempt-coerce (car args))
                      (coerce-all target-type (cdr args)))
                (coerce-all target-type (cdr args)))))))

(define (integer->complex n)
  (make-complex-from-real-imag (contents n) 0))
(put-coercion 'integer 'complex integer->complex)

(define test1 (make-integer 3))
(define test2 (make-complex-from-real-imag 4 5))

(define (add x y) (apply-generic 'add x y))
(add test1 test2)

(define (integer->rational n)
  (make-rational n 1))
(put-coercion 'integer 'rational integer->rational)

(define test3 (make-rational 3 4))
(add test1 test3)

; this won't work if there is some common type that is not amongst 
; the types of the arguments provided
