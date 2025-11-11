#!/usr/bin/env racket
#lang sicp

(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((or (= amount 0) (< amount 0) (= kinds-of-coins 0)) 1)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)
                 1))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 11)
(count-change 20)
(count-change 50)
(count-change 100)
