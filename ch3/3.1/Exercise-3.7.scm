#!/usr/bin/env racket
#lang sicp

(define (make-joint pwp-acc curr-pw new-pw)
  (define (dispatch pw req)
    (if (eq? pw new-pw)
        (pwp-acc curr-pw req)
        (lambda (amount) "Incorrect joint access password")))
  dispatch)

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pw req)
    (if (eq? pw password)
        (cond ((eq? req 'withdraw) withdraw)
              ((eq? req 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT"
                           req)))
        (lambda (amount) "Incorrect password")))
  dispatch)

(define peter-acc (make-account 100 'open-sesame))

; failed setup (wrong original owner password)
(define paul-fail
  (make-joint peter-acc 'sesame-open 'rosebud))
((paul-fail 'rosebud 'withdraw) 50)

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))
((paul-acc 'rosebud 'withdraw) 50)
((paul-acc 'wrong-pass 'withdraw) 50)
((paul-acc 'rosebud 'deposit) 25)

; failed setup (wrong paul owner password)
(define broken-acc
  (make-joint paul-acc 'open-sesame 'cookies))
((broken-acc 'cookies 'deposit) 25)

(define john-acc
  (make-joint paul-acc 'rosebud 'cookies))
((john-acc 'cookies 'deposit) 25)

((peter-acc 'open-sesame 'withdraw) 100)

(define joe-acc
  (make-joint peter-acc 'open-sesame 'banana))
((joe-acc 'banana 'deposit) 100)
