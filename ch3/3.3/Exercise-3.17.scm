#!/usr/bin/env racket
#lang sicp

(define (count-pairs x)
  (let ((visited '()))
    (define (visited? x counted)
      (cond ((null? counted) #f)
            ((eq? x (car counted)) #t)
            (else (visited? x (cdr counted)))))
    (define (counter x)
      (cond ((not (pair? x)) 0)
            ((visited? x visited) 0)
            (else (set! visited (cons x visited))
                  (+ (counter (car x))
                     (counter (cdr x))
                     1))))
    (counter x)))

(define l `(a b c))
(count-pairs l)

(define x '(b))
(define y (cons 'a x))
(count-pairs (cons y x))

(define z (cons x x))
(count-pairs (cons z z))

(set-cdr! (cddr l) l)
(count-pairs l) ; no longer infinite loop!
