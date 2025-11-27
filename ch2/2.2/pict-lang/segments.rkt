#lang sicp

(#%require "frames.rkt")
(#%require "drawing.rkt")

(#%provide make-segment)
(#%provide segments->painter)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (line-drawer
          ((frame-coord-map frame)
           (start-segment segment))
          ((frame-coord-map frame)
           (end-segment segment))))
      segment-list)))
(define (for-each proc items)
  (cond ((not (null? items))
         (proc (car items))
         (for-each proc (cdr items)))))
