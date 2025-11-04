#!/usr/bin/env racket
#lang sicp

(define (pascal x y)
  (if (or (= x 1) (= x y))
      1
      (+ (pascal (- x 1) (- y 1))
         (pascal x (- y 1)))))

(pascal 1 1)
(pascal 1 2)
(pascal 2 2)
(pascal 1 3)
(pascal 2 3)
(pascal 3 3)
(pascal 1 4)
(pascal 2 4)
(pascal 3 4)
(pascal 4 4)
(pascal 1 5)
(pascal 2 5)
(pascal 3 5)
(pascal 4 5)
(pascal 5 5)
