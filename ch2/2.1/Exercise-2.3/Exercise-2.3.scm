#!/usr/bin/env racket
#lang sicp

(#%require "rectangles.rkt")
(#%require "sqrt.rkt")
(#%require "pi.rkt")

(display "generate points from dimensions")
(newline)
(define rect-dm
  (make-rect-dm 11 7 (make-point 3 4) (deg-to-rad 30)))
(print-points rect-dm)
(print-dimensions rect-dm)
(perimeter rect-dm)
(area rect-dm)
(newline)

(display "simple rectangle made from points")
(newline)
(define rect-pt
  (make-rect-pt (make-point 1 1)
                (make-point 1 0)
                (make-point 0 1)
                (make-point 0 0)))
(print-points rect-pt)
(print-dimensions rect-pt)
(perimeter rect-pt)
(area rect-pt)
(newline)

(display "simple rectangle made from dimensions")
(newline)
(define rect-dm-2
  (make-rect-dm 1 1 (make-point 0 0) 0))
(print-dimensions rect-dm-2)
(print-points rect-dm-2)
(perimeter rect-dm-2)
(area rect-dm-2)
(newline)

(display "simple rectangle made from diagonals")
(newline)
(define rect-di
  (make-rect-di
    (make-segment (make-point 0 1) (make-point 1 0))
    (make-segment (make-point 0 0) (make-point 1 1))))
(perimeter rect-di)
(area rect-di)
(print-points rect-di)
(print-dimensions rect-di)
(newline)

(display "example of a false rectangle")
(newline)
(define rect-pt-2
  (make-rect-pt (make-point 1 -3)
                (make-point -2 1)
                (make-point 4 -1)
                (make-point 1 3)))
(newline)
