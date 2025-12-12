#!/usr/bin/env racket
#lang sicp

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (let ((which-branch
          (choose-branch symbol tree)))
    (let ((next-bit (car which-branch))
          (next-branch (cdr which-branch)))
      (if (leaf? next-branch)
          (list next-bit)
          (cons next-bit
                (encode-symbol symbol next-branch))))))

(define (choose-branch symbol tree)
  (cond ((element-of-set? symbol (symbols (left-branch tree)))
         (cons 0 (left-branch tree)))
        ((element-of-set? symbol (symbols (right-branch tree)))
         (cons 1 (right-branch tree)))
        (else (error "symbol not in tree: CHOOSE-BRANCH" symbol))))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                      (make-leaf 'D 1)
                      (make-leaf 'C 1)))))

(encode '(A D A B B C A) sample-tree)
