#lang racket

#|
  Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to
  be provided as a special form. “Why can’t I just define it as
  an ordinary procedure in terms of cond?” she asks. Alyssa’s
  friend Eva Lu Ator claims this can indeed be done, and she
  defines a new version of if:
    (define (new-if predicate then-clause else-clause)
      (cond (predicate then-clause)
        (else else-clause)))
  Eva demonstrates the program for Alyssa:
    (new-if (= 2 3) 0 5)
    5
    (new-if (= 1 1) 0 5)
    0
  Delighted, Alyssa uses new-if to rewrite the square-root
  program:
    (define (sqrt-iter guess x)
      (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  What happens when Alyssa attempts to use this to compute
  square roots? Explain.
|#


#|
  Answer:
  Let's see what happens in application:
  (sqrt-iter 1 9)
  -> (new-if (good-enough? 1 9) 1 (sqrt-iter (improve 1 9) 9))
    -> (cond ((good-enough? 1 9) 1) (sqrt-iter (improve 1 9) 9))
      -> (cond ((good-enough? 1 9) 1) (sqrt-iter (improve 1 9) 9))
        -> (cond ((good-enough? 1 9) 1) (sqrt-iter (5) 9))
          -> (cond ((good-enough? 1 9) 1) (new-if (good-enough? 5 9) 5 (sqrt-iter (improve 5 9) 9))
            -> (cond ((good-enough? 1 9) 1) ...
  -> forever evaluating the right side because expressions in procedures are fully evaluated before
      the procedure is called. But with the special form "if", the predicate is evaluated first, and
      only one of the clauses is evaluated depending on the resulting boolean.
|#