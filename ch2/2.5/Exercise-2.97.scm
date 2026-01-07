#!/usr/bin/env racket
#lang sicp

(#%require "general-arithmetic.rkt")

;(define (reduce-poly p1 p2)
;  (if (same-variable? (variable p1) (variable p2))
;      (map
;        (lambda (term-list)
;          (cons (variable p1) term-list))
;        (reduce-terms (term-list p1) (term-list p2)))
;      (error "Polys not in same var: REDUCE-POLY" (list p1 p2))))
;
;(define (reduce-terms n d)
;  (let ((nd-gcd (gcd-terms n d)))
;    (let ((c (coeff (first-term nd-gcd)))
;          (O1 (max (order (first-term n))
;                   (order (first-term d))))
;          (O2 (order (first-term nd-gcd))))
;      (let ((integerizing-factor (expt c (+ 1 (- O1 O2)))))
;        (let ((n2 (term-map n mul integerizing-factor))
;              (d2 (term-map d mul integerizing-factor)))
;          ; there will be no remainder
;          (let ((n3 (car (div-terms n2 nd-gcd)))
;                (d3 (car (div-terms d2 nd-gcd))))
;            (let ((nd-coeff-gcd
;                    (apply gcd (append (get-coeff n3) (get-coeff d3)))))
;              (let ((nn (term-map n3 div nd-coeff-gcd))
;                    (dd (term-map d3 div nd-coeff-gcd)))
;                (list nn dd)))))))))
;
;(define (term-map term-list op value)
;  (attach-tag (type-tag term-list)
;              (map
;                (lambda (term)
;                  (make-term
;                    (order term)
;                    (op (coeff term) value)))
;                (contents term-list))))
;
;;(define (reduce-integers n d)
;  (let ((g (gcd n d)))
;    (list (/ n g) (/ d g))))
;
;(define (reduce n d)
;  (apply-generic 'reduce n d))
;
;(put 'reduce '(integer integer) reduce-integers)
;(put 'reduce '(polynomial polynomial) reduce-poly)
;
;(define (make-rat n d)
;  (let ((reduced (reduce n d)))
;    (cons (car reduced) (cadr reduced))))

(define p1 (make-poly-sparse 'x '((1 1) (0 1))))
(define p2 (make-poly-sparse 'x '((3 1) (0 -1))))
(define p3 (make-poly-sparse 'x '((1 1))))
(define p4 (make-poly-sparse 'x '((2 1) (0 -1))))
(define rf1 (make-rational p1 p2))
(define rf2 (make-rational p3 p4))

(add rf1 rf2)
