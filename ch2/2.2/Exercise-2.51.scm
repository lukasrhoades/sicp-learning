#!/usr/bin/env racket
#lang sicp

(#%require "pict-lang.rkt")
(#%require "pict-lang/transforms.rkt")

(define (below-1 painter1 painter2)
  (let ((divider (make-vect 0 0.5)))
    (let ((bottom (transform-painter
                    painter1
                    (make-vect 0 0)
                    (make-vect 1 0)
                    divider))
          (top (transform-painter
                 painter2
                 divider
                 (make-vect 1 0.5)
                 (make-vect 0 1))))
      (lambda (frame) (bottom frame) (top frame)))))

(define (below-2 painter1 painter2)
  ; rotate whole thing 270 deg or 90cc (so painter2 on top)
  ; rotate individual painters 90 degrees or 270cc
  (cc-90 (beside (cc-270 painter1) (cc-270 painter2))))

(paint (below-1 (flip-vert wave) wave) "pictures/below1-fvw-w.png")
(paint (below-2 (flip-vert wave) wave) "pictures/below2-fvw-w.png")
