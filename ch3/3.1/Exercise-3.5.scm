#!/usr/bin/env racket
#lang sicp

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (region-test)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (P x y)))
  (let ((area-rectangle
          (* (- x2 x1) (- y2 y1))))
    (* area-rectangle (monte-carlo trials region-test))))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1)
                  trials-passed))))
  (iter trials 0))

(define (square x) (* x x))

(estimate-integral
  (lambda (x y) (<= (+ (square x) (square y)) 1))
  -2.0
  2.0
  -2.0
  2.0
  100000)
