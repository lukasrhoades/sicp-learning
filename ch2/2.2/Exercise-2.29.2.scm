#!/usr/bin/env racket
#lang sicp

(define (make-mobile left right) (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))

(define mob1 
  (make-mobile
    (make-branch 4
                 (make-mobile
                   (make-branch 3 5)
                   (make-branch 2 10)))
    (make-branch 2 7)))
mob1
(left-branch mob1)
(right-branch mob1)
(branch-length (right-branch mob1))
(branch-structure (right-branch mob1))

(define (total-weight x)
  (cond ((or (null? x) (not (pair? x))) 0)
        ((and (not (pair? (branch-length x)))
              (not (pair? (branch-structure x))))
         (branch-structure x))
        (else (+ (total-weight (left-branch x))
                 (total-weight (right-branch x))))))

(total-weight mob1)

(define (balanced? x) (test-submobiles x))
(define (balanced-submobile? x)
  (and (= (torque (left-branch x))
          (torque (right-branch x)))))
(define (torque x)
  (* (branch-length x)
     (total-weight x)))
(define (test-submobiles x)
  (cond ((not (pair? x)) true)
        ((is-mobile? x) (and (balanced-submobile? x)
                             (test-submobiles (branch-structure (left-branch x)))
                             (test-submobiles (branch-structure (right-branch x)))))
        (else (and (test-submobiles (branch-structure (left-branch x)))
                   (test-submobiles (branch-structure (right-branch x)))))))
(define (is-mobile? x)
  (and (pair? (left-branch x)) (pair? (right-branch x))))

(balanced? mob1)

(define mob2
  (make-mobile
    (make-branch 3
                 (make-mobile
                   (make-branch 3
                                (make-mobile
                                  (make-branch 2 3)
                                  (make-branch 6 1)))
                   (make-branch 12 1)))
    (make-branch 5
                 (make-mobile
                   (make-branch 4 1)
                   (make-branch 2 2)))))
(balanced? mob2)
