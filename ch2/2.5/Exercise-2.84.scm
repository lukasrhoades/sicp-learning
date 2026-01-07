#!/usr/bin/env racket
#lang sicp

(define type-tower
  (list 'integer 'rational 'real 'complex))
(define (add-type type-tower to-add sub-type super-type)
  (define (iter prev items)
    (if (null? items)
        (error "not a valid entry: ADD-TYPE"
               (list to-add sub-type super-type type-tower))
        (let ((curr (car items)))
          (if (and (eq? prev sub-type) (eq? curr super-type))
              (append (list prev to-add curr) (cdr items))
              (iter curr (cdr items))))))
  (iter '() type-tower))

(define (apply-generic op type-tower . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (let ((try-raise (raise-args args op type-tower)))
            (if try-raise
                (apply (car try-raise) (cdr try-raise))
                (error "No method for these types: APPLY-GENERIC"
                       (list op type-tags))))))))

(define (raise-args args op type-tower)
  (let ((types (map type-tag args)))
    (let ((t1 (car types))
          (t2 (cadr types))
          (arg1 (car args))
          (arg2 (cadr args)))
      (cond ((eq? t1 t2)
             (cons (get op types) (map contents args)))
            ((lower? t1 t2 type-tower)
             (let ((raised (raise arg1)))
               (if raised
                   (raise-args (list raised arg2) op type-tower)
                   #f)))
            (else
              (let ((raised (raise arg2)))
                (if raised
                    (raise-args (list arg1 raised) op type-tower)
                    #f)))))))
(define (lower? type1 type2 type-tower)
  (cond ((null? type-tower)
         (error "Types not present in type tower: LOWER?"
                (list type1 type2 type-tower)))
        ((eq? (car type-tower) type1) #t)
        ((eq? (car type-tower) type2) #f)
        (else (lower? type1 type2 (cdr type-tower)))))
