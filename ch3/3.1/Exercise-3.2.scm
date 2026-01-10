#!/usr/bin/env racket
#lang sicp

(define (make-monitored f)
  (define (mf counter)
    (lambda (m)
      (cond ((eq? m 'how-many-calls?) counter)
            ((eq? m 'reset-count) (set! counter 0))
            (else (set! counter (+ counter 1))
                  (f m)))))
  (mf 0))

(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)
(s 25)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?) 
