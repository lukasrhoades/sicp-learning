#!/usr/bin/env racket
#lang sicp

(#%require "pict-lang.rkt")
(#%require "pict-lang/transforms.rkt")

(define (wave frame)
  ((segments->painter
     (list (make-segment
             (make-vect 0.35 0)
             (make-vect 0.475 0.4))
           (make-segment
             (make-vect 0.475 0.4)
             (make-vect 0.6 0))
           (make-segment
             (make-vect 0.7 0)
             (make-vect 0.6 0.6))
           (make-segment
             (make-vect 0.6 0.6)
             (make-vect 1 0.4))
           (make-segment
             (make-vect 1 0.5)
             (make-vect 0.65 0.75))
           (make-segment
             (make-vect 0.65 0.75)
             (make-vect 0.55 0.7))
           (make-segment
             (make-vect 0.55 0.7)
             (make-vect 0.6 0.9))
           (make-segment
             (make-vect 0.6 0.9)
             (make-vect 0.55 1))
           (make-segment
             (make-vect 0.4 1)
             (make-vect 0.35 0.9))
           (make-segment
             (make-vect 0.35 0.9)
             (make-vect 0.4 0.7))
           (make-segment
             (make-vect 0.4 0.7)
             (make-vect 0.35 0.75))
           (make-segment
             (make-vect 0.35 0.75)
             (make-vect 0.25 0.65))
           (make-segment
             (make-vect 0.25 0.65)
             (make-vect 0 0.85))
           (make-segment
             (make-vect 0 0.75)
             (make-vect 0.25 0.5))
           (make-segment
             (make-vect 0.25 0.5)
             (make-vect 0.35 0.6))
           (make-segment
             (make-vect 0.35 0.6)
             (make-vect 0.25 0))
           (make-segment
             (make-vect 0.46 0.9)
             (make-vect 0.46 0.85))
           (make-segment
             (make-vect 0.49 0.9)
             (make-vect 0.49 0.85))
           (make-segment
             (make-vect 0.445 0.8)
             (make-vect 0.475 0.75))
           (make-segment
             (make-vect 0.475 0.75)
             (make-vect 0.505 0.8))))
   frame))

(paint wave "pictures/smiley-wave.png")

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((top (beside (up-split painter (- n 1))
                         (corner-split painter (- n 1))))
            (bottom (beside painter
                            (right-split painter (- n 1)))))
        (below bottom top))))

(paint (corner-split wave 4) "pictures/newcs-wave-4.png")

(define square-limit
  (square-of-four flip-vert rotate180 
                  (lambda (x) x) flip-horiz))

(paint (square-limit (corner-split wave 4))
       "pictures/newsl-wave-4.png")
