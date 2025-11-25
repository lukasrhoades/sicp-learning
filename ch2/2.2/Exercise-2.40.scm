#!/usr/bin/env racket
#lang sicp

(#%require "primes.rkt")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))
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

(unique-pairs 6)

(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(prime-sum-pairs 6)
