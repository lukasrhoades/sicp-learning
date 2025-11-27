#lang sicp

(#%require "vectors.rkt")
(#%require "frames.rkt")

(#%provide transform-painter)
(#%provide beside)
(#%provide below)

(#%provide flip-horiz)
(#%provide flip-vert)

(#%provide shrink-to-upper-right)
(#%provide squash-inwards)

(#%provide rotate180)
(#%provide cc-90)
(#%provide cc-180)
(#%provide cc-270)

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (sub-vect (m corner1) new-origin)
                  (sub-vect (m corner2) new-origin)))))))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0)))
    (let ((paint-left
            (transform-painter painter1
                               (make-vect 0 0)
                               split-point
                               (make-vect 0 1)))
          (paint-right
            (transform-painter painter2
                               split-point
                               (make-vect 1 0)
                               (make-vect 0.5 1))))
      (lambda (frame) (paint-left frame) (paint-right frame)))))

(define (below painter1 painter2)
  (cc-90 (beside (cc-270 painter1) (cc-270 painter2))))

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 1 1)
                     (make-vect 0 0)))

(define (shrink-to-upper-right painter)
  (transform-painter painter
                     (make-vect 0.5 0.5)
                     (make-vect 1 0.5)
                     (make-vect 0.5 1)))

(define (squash-inwards painter)
  (transform-painter painter
                     (make-vect 0 0)
                     (make-vect 0.65 0.35)
                     (make-vect 0.35 0.65)))

(define (rotate180 painter)
  ((compose flip-vert flip-horiz) painter))

(define (cc-90 painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 1 1)
                     (make-vect 0 0)))

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

(define (compose f g) (lambda (x) (f (g x))))
