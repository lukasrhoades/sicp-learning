#!/usr/bin/env racket
#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc n) (+ n 1))

((compose square inc) 6)
