#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

(define p1 (make-poly-sparse 'x '((2 1) (0 1))))
(define p2 (make-poly-sparse 'x '((3 1) (0 1))))
(define rf (make-rational p2 p1))

(add rf rf)
