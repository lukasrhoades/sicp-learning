#!/usr/bin/env racket
#lang sicp

(#%require "pict-lang.rkt")
(#%require "pict-lang/transforms.rkt")

(define tl (make-vect 0 1))
(define tr (make-vect 1 1))
(define bl (make-vect 0 0))
(define br (make-vect 1 0))

(define (outline frame)
  ((segments->painter
    (list (make-segment bl br)
          (make-segment br tr)
          (make-segment tr tl)
          (make-segment tl bl)))
   frame))

(define (X frame)
  ((segments->painter
     (list (make-segment bl tr)
           (make-segment tl br)))
   frame))

(define (diamond frame)
  ((segments->painter
     (list (make-segment
             (make-vect 0.5 0)
             (make-vect 1 0.5))
           (make-segment
             (make-vect 1 0.5)
             (make-vect 0.5 1))
           (make-segment
             (make-vect 0.5 1)
             (make-vect 0 0.5))
           (make-segment
             (make-vect 0 0.5)
             (make-vect 0.5 0))))
   frame))

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

(paint outline "pictures/outline.png")
(paint (shrink-to-upper-right outline) "pictures/stur-outline.png")
(paint (squash-inwards outline) "pictures/si-outline.png")
(paint X "pictures/X.png")
(paint diamond "pictures/diamond.png")
(paint wave "pictures/wave.png")
(paint (cc-90 wave) "pictures/cc90-wave.png")
(paint (flip-vert wave) "pictures/fv-wave.png")
