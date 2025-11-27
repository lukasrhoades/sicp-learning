#lang sicp

(#%require "vectors.rkt")

(#%provide make-frame)
(#%provide origin-frame)
(#%provide edge1-frame)
(#%provide edge2-frame)
(#%provide frame-coord-map)

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                (scale-vect (ycor-vect v) (edge2-frame frame))))))
