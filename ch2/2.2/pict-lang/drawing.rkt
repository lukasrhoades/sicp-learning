#lang sicp

(#%require (lib "racket/draw"))
(#%require racket/class)
(#%require "vectors.rkt")
(#%require "frames.rkt")

(#%provide line-drawer)
(#%provide paint)

(define target (make-bitmap 500 500))
(define dc (new bitmap-dc% [bitmap target]))
(define line-drawer
  (lambda (u v)
    (send dc draw-line
          (car u) (cdr u)
          (car v) (cdr v))))

(define unit (make-frame
               (make-vect 0 0)
               (make-vect 1 0)
               (make-vect 0 1)))

; want 400x400 image in 500x500 canvas (so can see outline)
; origin is top left because of how racket coordinates work
;(define frame (make-frame
;               (make-vect 50 450)  ; bl = right 50 pixels, down 450
;               (make-vect 400 0)    ; go right 400 pixels
;               (make-vect 0 -400))) ; go up 400 pixels

; this produces the above frame using new corners
(define racket-correct
  (let ((m (frame-coord-map unit)))
    (let ((new-origin (m (make-vect 50 450))))
      (make-frame
        new-origin
        (sub-vect (m (make-vect 450 450)) new-origin)
        (sub-vect (m (make-vect 50 50)) new-origin)))))

(define (paint painter output)
  (send dc clear)
  (painter racket-correct)
  (send target save-file output 'png))
