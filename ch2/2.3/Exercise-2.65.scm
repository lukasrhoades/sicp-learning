#!/usr/bin/env racket
#lang sicp

(define (union-set set1 set2)
  (let ((list1 (tree->list set1))
        (list2 (tree->list set2)))
    (list->tree (union-set-lists list1 list2))))

(define (union-set-lists list1 list2)
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else
          (let ((x1 (car list1)) (x2 (car list2)))
            (cond ((= x1 x2)
                   (cons x1
                         (union-set-lists (cdr list1)
                                          (cdr list2))))
                  ((< x1 x2)
                   (cons x1
                         (union-set-lists (cdr list1)
                                          list2)))
                  ((> x1 x2)
                   (cons x2
                         (union-set-lists list1
                                          (cdr list2)))))))))

(define (intersection-set set1 set2)
  (let ((list1 (tree->list set1))
        (list2 (tree->list set2)))
    (list->tree (intersection-set-lists list1 list2))))

(define (intersection-set-lists list1 list2)
  (if (or (null? list1) (null? list2))
      '()
      (let ((x1 (car list1)) (x2 (car list2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-lists (cdr list1)
                                             (cdr list2))))
              ((< x1 x2)
               (intersection-set-lists (cdr list1) list2))
              ((> x1 x2)
               (intersection-set-lists list1 (cdr list2)))))))

(define (tree->list tree)
  (define (copy-to-list tree result)
    (if (null? tree)
        result
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
                (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result
                    (partial-tree
                      (cdr non-left-elts)
                      right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts
                      (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))

(define make-tree list)
(define entry car)
(define left-branch cadr)
(define right-branch caddr)

(define set1
  (make-tree 8
             (make-tree 4
                        (make-tree 1 '() '())
                        (make-tree 7 '() '()))
             (make-tree 10
                        (make-tree 9 '() '())
                        (make-tree 12 '() '()))))
(define set2
  (make-tree 6
             (make-tree 3
                        (make-tree 2 '() '())
                        (make-tree 7 '() '()))
             (make-tree 9
                        (make-tree 8 '() '())
                        (make-tree 12 '() '()))))

(union-set set1 set2)
(intersection-set set1 set2)
