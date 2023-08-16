#lang racket

#|
  Exercise 1.7: The good-enough? test used in computing
  square roots will not be very effective for finding the square
  roots of very small numbers. Also, in real computers, arithmetic
  operations are almost always performed with limited
  precision. This makes our test inadequate for very large
  numbers. Explain these statements, with examples showing
  how the test fails for small and large numbers. An alternative
  strategy for implementing good-enough? is to watch
  how guess changes from one iteration to the next and to
  stop when the change is a very small fraction of the guess.
  Design a square-root procedure that uses this kind of end
  test. Does this work better for small and large numbers?
|#


#|
  Answer:
  With very large numbers we can end up with an infinite loop as the guesses cannot be improved
  because of rounding errors and the difference between square of guess and x will never reach <0.001.
  With very small numbers we can never get the correct answer if x is smaller than our hardcoded
  error margin for good-enough?. This is because we will soon reach an improved guess that satisfies
  the predicate, but since the target x is so small, the result is useless as it is not precise enough
  (the error could be in the magnitude of x itself rather than a small fraction of it).

  The alternative works much better as our good-enough? method no longer depends on x at all, so it
  doesn't matter whether x is very small or very large. The resulting error will always be small relative
  to x.
|#
(provide ans)


(define (ans x)
  (sqrt-iter 1.0 0.0 x))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess x))
  )

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2)
  )

(define (good-enough? guess prev-guess)
  (< (abs (/ (- guess prev-guess) guess)) 0.000000001)
  )
