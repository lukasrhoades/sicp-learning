#!/usr/bin/env racket
#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (apply res count)
    (if (= count n)
        res
        (compose f res)))
  (apply f 1))

(define (even? n)
  (= (remainder n 2) 0))
(define (square x) (* x x))
(define (exp base pow)
  (define (exp-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (exp-iter a (square b) (/ n 2)))
          (else (exp-iter (* a b) b (- n 1)))))
  (exp-iter 1 base pow))

(define (nth-root n)
  (lambda (x) (fixed-point
                ((repeated average-damp (floor (log n 2)))
                 (lambda (y) (/ x (exp y (- n 1)))))
                1.0)))

((nth-root 2) 4) ; 1
((nth-root 3) 8) ; 1
((nth-root 4) 16) ; 2
((nth-root 5) 32) ; 2
((nth-root 6) 64) ; 2
((nth-root 7) 128) ; 2
((nth-root 8) 256) ; 3 but very slow

; determined pattern is floor of log_2 n
