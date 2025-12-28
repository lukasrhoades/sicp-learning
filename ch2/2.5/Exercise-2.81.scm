#!/usr/bin/env racket
#lang sicp

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car tags))
                    (a2 (cadr tags)))
                (if (eq? t1 t2)
                    (error "No method for these types"
                           (list op type-tags))
                    (let ((t1->t2 (get-coercion type1 type2)))
                      (if t1->t2
                          (apply-generic (t1->t2 a1) a2)
                          (let ((t2->t1 (get-coercion type2 type1)))
                            (if t2->t1
                                (apply-generic a1 (t2->t1 a2))
                                (error "No method for these types"
                                       (list op type-tags))))))))
              (error "No method for these types"
                     (list op type-tags)))))))
