#lang sicp

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(f-recursive 0)
(f-recursive 1)
(f-recursive 2)
(f-recursive 3)
(f-recursive 4)
(f-recursive 5)


(define (f-iterative n)
  (define (f-iter a b c n)
    (cond ((< n 3) n)
          ((= n 3) (+ c (* 2 b) (* 3 a)))
          (else (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1)))))
  (f-iter 0 1 2 n))

(f-recursive 0)
(f-recursive 1)
(f-recursive 2)
(f-recursive 3)
(f-recursive 4)
(f-recursive 5)