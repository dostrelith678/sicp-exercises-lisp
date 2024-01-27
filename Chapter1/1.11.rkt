#lang racket

#|
  Exercise 1.11: A function f is defined by the rule that
  f (n) =
    n if n < 3,
    f (n - 1) + 2f (n - 2) + 3f (n - 3) if n >= 3.
  
  Write a procedure that computes f by means of a recursive
  process. Write a procedure that computes f by means of an
  iterative process.
|#

(provide ans-rec)
(define (ans-rec n)
  (if (< n 3)
      n
      (+ (ans-rec (- n 1)) (* 2 (ans-rec (- n 2))) (* 3 (ans-rec (- n 3))))
      ))


(provide ans-iter)
(define (ans-iter n)
  (define (iter i a b c)
    (if (= i n)
        (+ a (* 2 b) (* 3 c))
        (iter (+ i 1) (+ a (* 2 b) (* 3 c)) a b)
        )
    )
  (if (< n 3)
      n
      (iter 3 2 1 0)))
