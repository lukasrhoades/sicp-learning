#!/usr/bin/env racket
#lang sicp

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination
                  coin-values))
             (cc (- amount
                    (first-denomination
                     coin-values))
                 coin-values)))))

(define (first-denomination items) (car items))
(define (except-first-denomination items) (cdr items))
(define (no-more? items)
  (= (length items) 0))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins)
(cc 100 uk-coins)

(define us-coins2 (list 1 5 10 25 50))
(cc 100 us-coins2)

(define us-coins3 (list 10 5 25 50 1))
(cc 100 us-coins3)
