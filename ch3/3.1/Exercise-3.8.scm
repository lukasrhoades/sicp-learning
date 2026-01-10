#!/usr/bin/env racket
#lang sicp

(define count 0)

(define (f x)
  (if (= count 0)
      (begin (set! count (+ count 1))
             x)
      0))

(+ (f 0) (f 1))

(set! count 0)

(+ (f 1) (f 0))
