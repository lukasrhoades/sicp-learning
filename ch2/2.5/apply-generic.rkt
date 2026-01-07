#!/usr/bin/env rackeet
#lang sicp

(#%require "dispatch.rkt")

(#%provide type-tower)
(#%provide add-type)
(#%provide apply-generic apply-generic-nd)
(#%provide drop)

(define (drop type-object)
  ; don't use generics, if no proc -> return og object NOT error
  (if (number? type-object)
      type-object
      (let ((project-op (get 'project (type-tag type-object))))
        (if project-op
            (let ((projected (project-op (contents type-object))))
              (let ((raise-op (get 'raise (type-tag projected))))
                (if raise-op
                    (let ((raised (raise-op (contents projected))))
                      (let ((equality-op
                              (get 'equ?
                                   (map type-tag
                                        (list type-object
                                              raised)))))
                        (if equality-op
                            (if (equality-op (contents raised)
                                             (contents type-object))
                                projected
                                type-object)
                            type-object)))
                    type-object)))
            type-object))))

(define type-tower
  (list 'integer 'rational 'real 'complex))
(define (add-type to-add sub-type super-type)
  (define (iter prev items)
    (if (null? items)
        (error "not a valid entry: ADD-TYPE"
               (list to-add sub-type super-type type-tower))
        (let ((curr (car items)))
          (if (and (eq? prev sub-type) (eq? curr super-type))
              (append (list prev to-add curr) (cdr items))
              (iter curr (cdr items))))))
  (set! type-tower (iter '() type-tower)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          ; don't drop if it's a predicate
          (let ((res (apply proc (map contents args))))
            (cond ((eq? #t res) #t)
                  ((eq? #f res) #f)
                  (else (drop res))))
          (let ((try-raise (raise-args args op)))
            (if (car try-raise)
                (let ((res (apply (car try-raise) (cdr try-raise))))
                  (cond ((eq? #t res) #t)
                        ((eq? #f res) #f)
                        (else (drop res))))
                (error "No method for these types: APPLY-GENERIC"
                       (list op type-tags))))))))

(define (apply-generic-nd op . args)
  ; certain operations do not want to auto-drop, otherwise loops
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (let ((res (apply proc (map contents args))))
            (cond ((eq? #t res) #t)
                  ((eq? #f res) #f)
                  (else res)))
          (let ((try-raise (raise-args args op)))
            (if (car try-raise)
                (let ((res (apply (car try-raise) (cdr try-raise))))
                  (cond ((eq? #t res) #t)
                        ((eq? #f res) #f)
                        (else res)))
                (error "No method for these types: APPLY-GENERIC"
                       (list op type-tags))))))))

(define (raise-args args op)
  (let ((types (map type-tag args)))
    (let ((t1 (car types))
          (t2 (cadr types))
          (arg1 (car args))
          (arg2 (cadr args)))
      (cond ((eq? t1 t2)
             (cons (get op types) (map contents args)))
            ((lower? t1 t2 type-tower)
             (let ((raised ((get 'raise t1) (contents arg1))))
               (if raised
                   (raise-args (list raised arg2) op)
                   #f)))
            (else
              (let ((raised ((get 'raise t2) (contents arg2))))
                (if raised
                    (raise-args (list arg1 raised) op)
                    #f)))))))
(define (lower? type1 type2 type-tower)
  (cond ((null? type-tower)
         (error "Types not present in type tower: LOWER?"
                (list type1 type2 type-tower)))
        ((eq? (car type-tower) type1) #t)
        ((eq? (car type-tower) type2) #f)
        (else (lower? type1 type2 (cdr type-tower)))))
