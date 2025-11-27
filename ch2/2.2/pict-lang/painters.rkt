#lang sicp

(#%require "vectors.rkt")
(#%require "segments.rkt")

(#%provide wave)

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
             (make-vect 0.25 0))))
   frame))
