#!/usr/bin/env racket
#lang sicp

; stuff for testing
(define random-init 1)
(define (rand-update x)
  (remainder (+ (* 3 x) 5) 10))

(define rand
  (let ((x random-init))
    (lambda (operation)
      (cond ((eq? operation 'generate)
              (set! x (rand-update x))
              x)
            ((eq? operation 'reset)
             (lambda (new-value) (set! x new-value)))
            (else
              (error "Invalid operation: RAND"
                     operation))))))

(rand 'generate)
(rand 'generate)
((rand 'reset) 4)
(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 4)
(rand 'generate)
(rand 'generate)
(rand 'generate)
