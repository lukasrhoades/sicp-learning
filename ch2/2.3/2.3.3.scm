#!/usr/bin/env racket
#lang sicp

; sets as unordered lists
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

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; sets as ordered lists
(define (element-of-set?-2 x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set-2 set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set-2 (cdr set1) (cdr set2))))
              ((< x1 x2)
               (intersection-set-2 (cdr set1) set2))
              ((> x1 x2)
               (intersection-set-2 set1 (cdr set2)))))))

; sets as binary trees
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set?-3 x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set?-3 x (left-branch set)))
        ((> x (entry set))
         (element-of-set?-3 x (right-branch set)))))

(define (adjoin-set-3 x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set-3 x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set3 x (right-branch set))))
