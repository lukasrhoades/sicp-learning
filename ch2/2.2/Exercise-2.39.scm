#!/usr/bin/env racket
#lang sicp

(define (reverse-r sequence)
  ; have to handle the final nil
  (fold-right (lambda (x y) (append y (list x))) nil sequence))
(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (fold-right op init (cdr seq)))))
(define (append list1 list2)
  (fold-right cons list2 list1))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(reverse-r (list 1 2 3 4))
(reverse-l (list 1 2 3 4))
