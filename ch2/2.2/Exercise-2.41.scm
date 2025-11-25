#!/usr/bin/env racket
#lang sicp

(define (sum-triples n s)
  (define (sum-s? triple)
    (= (+ (car triple) (cadr triple) (caddr triple)) s))
  (filter sum-s? (unique-triples n)))
(define (unique-triples n)
  (filter unique? (triples n)))
(define (triples n)
  ; appends all n lists where each has a common i together
  (flatmap (lambda (i)
             ; appends lists with common j together within lists of common i
             (flatmap (lambda (j)
                        ; list of n lists, each with n^3 internal lists
                        ; use normal map because want to preserve triplets
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 n)))
                      (enumerate-interval 1 n)))
           (enumerate-interval 1 n)))
(define (unique? triple)
  (let ((i (car triple))
        (j (cadr triple))
        (k (caddr triple)))
    (and (not (= i j)) (not (= i k)) (not (= j k)))))

(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))
(define (append list1 list2)
  (accumulate cons list2 list1))
(define (map proc seq)
  (accumulate (lambda (x y) (cons (proc x) y)) nil seq))
(define (enumerate-interval a b)
  (if (> a b)
      nil
      (cons a (enumerate-interval (+ a 1) b))))

(sum-triples 5 10)
