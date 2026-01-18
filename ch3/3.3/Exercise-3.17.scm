#!/usr/bin/env racket
#lang sicp

(define (count-pairs x)
  (let ((visited '()))
    (define (visited? x)
      (if (memq x visited) #t #f))
    (define (counter x)
      (cond ((not (pair? x)) 0)
            ((visited? x) 0)
            (else (set! visited (cons x visited))
                  (+ (counter (car x))
                     (counter (cdr x))
                     1))))
    (counter x)))

(define (memq item x)
  (cond ((null? x) #f)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))
;(define (visited? x counted)
;  (cond ((null? counted) #f)
;        ((eq? x (car counted)) #t)
;        (else (visited? x (cdr counted)))))

(define l `(a b c))
(count-pairs l)

(define x '(b))
(define y (cons 'a x))
(count-pairs (cons y x))

(define z (cons x x))
(count-pairs (cons z z))

(set-cdr! (cddr l) l)
(count-pairs l) ; no longer infinite loop!
