#!/usr/bin/env racket
#lang sicp

(#%require "pict-lang.rkt")

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define (cc-180 painter)
  (transform-painter painter
                     (make-vect 1 1)
                     (make-vect 0 1)
                     (make-vect 1 0)))

(define (cc-270 painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(paint (flip-horiz wave) "pictures/fh-wave.png")
(paint (cc-180 wave) "pictures/cc180-wave.png")
(paint (cc-270 wave) "pictures/cc270-wave.png")
