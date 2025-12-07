#!/usr/bin/env racket
#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))
(define (equal? v1 v2)
  (cond ((and (number? v1) (number? v2))
         (= v1 v2))
        ((and (not (pair? v1)) (not (pair? v2)))
         (eq? v1 v2))
        ((and (pair? v1) (pair? v2))
         (and (equal? (car v1) (car v2))
              (equal? (cdr v1) (cdr v2))))
        (else false)))

(define (adjoin-set x set) (cons x set))

(define (union-set set1 set2)
  (append set1 set2))
(define (append list1 list2)
  (accumulate cons list2 list1))
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(adjoin-set 1 '(1 1 2 3 2))
(union-set '(2 3 2 1 3 2 2) '(4 3 3 9 8 2))
(intersection-set '(2 3 2 1 3 2 2) '(4 3 3 9 8 2))


