#!/usr/bin/env racket
#lang sicp

(define (project type-object)
  (apply-generic 'project type-object))

(define (install-project-complex)
  (define (project complex)
    (make-real (real-part complex)))
  (put 'project '(complex) project)
  'done)

(define (install-project-real)
  (define (project real)
    (round real))
  (put 'project '(real) project)
  'done)

(define (install-project-rational)
  (define (project rational)
    (round (/ (numer rational) (denom rational))))
  (put 'project '(rational) project)
  'done)

(define (drop type-object)
  (if (number? type-object)
      type-object
      (let ((try-drop (project type-object)))
        (if try-drop
            (let ((projected (try-drop type-object)))
              (if (equ? (raise projected) type-object)
                  (drop projected)
                  type-object))
            type-object)))

(define (apply-generic op type-tower . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (drop (apply proc (map contents args)))
          (let ((try-raise (raise-args args type-tower)))
            (if try-raise
                (drop (apply (car try-raise) (cdr try-raise)))
                (error "No method for these types: APPLY-GENERIC"
                       (list op type-tags))))))))
