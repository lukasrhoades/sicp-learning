#!/usr/bin/env racket
#lang sicp

(define (square-tree-1 tree)
  (cond ((null? tree) nil)
        ((not (pair? tree))
         (square tree))
        (else (cons (square-tree-1 (car tree))
                    (square-tree-1 (cdr tree))))))
(define (square x) (* x x))

(define test
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
(square-tree-1 test)

(define (square-tree-2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-2 sub-tree)
             (square sub-tree)))
       tree))

(square-tree-2 test)
