#!/usr/bin/env racket
#lang sicp

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define z (make-cycle (list 'a 'b 'c)))
;(last-pair z) ; this will endlessly loop

; this is because after the first cdr, the
; next cdr will return to the starting point
; as can be seen in the accompanying diagram (see pdf)
