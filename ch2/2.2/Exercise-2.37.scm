#!/usr/bin/env racket
#lang sicp

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(dot-product (list 1 2 3) (list 4 5 6))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(matrix-*-vector m (list 1 2 3))

(define (transpose mat)
  (accumulate-n cons nil mat))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(transpose m)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(matrix-*-matrix m m)
