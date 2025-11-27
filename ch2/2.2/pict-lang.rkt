#lang sicp

(#%require "pict-lang/vectors.rkt")
(#%require "pict-lang/segments.rkt")
(#%require "pict-lang/frames.rkt")
(#%require "pict-lang/transforms.rkt")
(#%require "pict-lang/painters.rkt")
(#%require "pict-lang/drawing.rkt")

(#%provide make-vect)
(#%provide segments->painter)
(#%provide make-segment)
(#%provide make-frame)
(#%provide wave)
(#%provide paint)

(#%provide transform-painter)
(#%provide beside)
(#%provide below)

(#%provide split)
(#%provide right-split)
(#%provide up-split)
(#%provide corner-split)

(#%provide square-of-four)
(#%provide square-limit)

(define (split op1 op2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split op1 op2) painter (- n 1))))
          (op1 painter (op2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define square-limit
  (square-of-four flip-horiz (lambda (x) x)
                  rotate180 flip-vert))
