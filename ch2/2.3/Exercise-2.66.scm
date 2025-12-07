#!/usr/bin/env racket
#lang sicp

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= given-key (key (entry set-of-records)))
         (entry set-of-records))
        ((< given-key (key (entry set-of-records)))
         (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (set-of-records)))
         (lookup given-key (right-branch set-of-records)))))

(define make-tree list)
(define entry car)
(define left-branch cadr)
(define right-branch caddr)
