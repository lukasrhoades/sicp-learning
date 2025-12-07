#!/usr/bin/env racket
#lang sicp

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))

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

(union-set '(1 2 3) '(3 4 5))
