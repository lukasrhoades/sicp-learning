#!/usr/bin/env racket
#lang sicp

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

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-passwod 'deposit) 50)
