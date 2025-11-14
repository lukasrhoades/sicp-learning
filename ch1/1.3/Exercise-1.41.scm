#!/usr/bin/env racket
#lang sicp

(define (double procedure)
  (lambda (x) (procedure (procedure x))))

(define (inc x) (+ x 1))

((double inc) 0)

(((double double) inc) 5)

(((double (double double)) inc) 5)

((double (double (double inc))) 5)

(((double (double (double double))) inc) 5)

(((double (double (double (double double)))) inc) 5)
