#!/usr/bin/env racket
#lang sicp

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

; col is basically list index
(define (adjoin-position row col positions)
  (append positions (list (pos row col))))
(define empty-board nil)
(define pos list)
(define row car)
(define col cadr)

(define (safe? k positions)
  (if (< k 2)
      true  ; always true if 1 column
      (= (accumulate + 0 (check k positions)) 0)))

(define (check k positions)
  ; know there will be no other queens in the same column
  ; have to check same row or diagonal

  ; row / col -> if 0, then same row -> not safe
  ; row / col -> if abs is 1 then diag -> not safe
  (define (get-curr k positions)
    (if (= k 1)
        (car positions)
        (get-curr (- k 1) (cdr positions))))
  (let ((curr (get-curr k positions)))
        ; produces list of all checks, if sum 0 then all checks true
        ; compare (only) current to all positions, depends on induction
        (map (lambda (relative)
               ; check if same column
               (if (= (col curr) (col relative))
                   0
                   (let ((ratio
                           (/ (- (row curr) (row relative))
                              (- (col curr) (col relative)))))
                     (if (or (= ratio 0)
                             (= (abs ratio) 1))
                         1
                         0))))
             positions)))

(define (append list1 list2)
  (accumulate cons list2 list1))
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (abs x)
  (if (not (< x 0)) x (- x)))

(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))
(define (enumerate-interval a b)
  (if (> a b)
      nil
      (cons a (enumerate-interval (+ a 1) b))))

(queens 8)
