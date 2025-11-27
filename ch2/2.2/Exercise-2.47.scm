#!/usr/bin/env racket
#lang sicp

(define (make-frame-1 origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame-1 frame-1) (car frame-1))
(define (edge1-frame-1 frame-1) (cadr frame-1))
(define (edge2-frame-1 frame-1) (caddr frame-1))

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame-2 frame-2) (car frame-2))
(define (edge1-frame-2 frame-2) (cadr frame-2))
(define (edge2-frame-2 frame-2) (cddr frame-2))
