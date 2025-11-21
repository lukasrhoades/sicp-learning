#!/usr/bin/env racket
#lang sicp

(define (square-list1 items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list1 (cdr items)))))
(define (square-list2 items)
  (map square items))
(define (square x) (* x x))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(square-list1 (list 1 2 3 4))
(square-list2 (list 1 2 3 4))
