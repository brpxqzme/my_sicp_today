;; Exercise 1.7: Reconsidering tolerance values

;; The test for a tolerance within 0.001 of a guess' square fails for very
;; small numbers because the square of a very small number is very small, and
;; 0.001 is very big compared to that.

;; The interpreter gives the result .04124542607499115 for (sqrt 0.001). The
;; square of this is approximately 0.0017, almost twice as much as the original
;; input value.

;; The limited precision on very large numbers on a real computer means that a
;; number can be so large that the precision of the thousandsth place is not
;; only irrelevant for most practical purposes, but also disallowed lest a
;; number's representation in data exceeds its type's capabilities. Once that
;; limit is reached, GOOD-ENOUGH? cannot perform the subtraction of GUESS and X
;; and still get a meaningful answer. The procedure will hopefully still
;; terminate by perceiving the difference to be 0, but if we were expecting the
;; result to be within 0.001 of the guess' square, we'd be fooling ourselves.

;; The following square-root procedure uses the suggested "fraction" end-test.
;; In fact, only the good-enough? procedure has been changed. Once the improved
;; guess would be within 0.1% of the present guess, we give the present guess.
;; For our example of (sqrt 0.001) the interpreter gives 3.1642015868650786e-2
;; which squared is 1.0012171682319481e-3, or 0.001 with about 0.12% error. For
;; large numbers limited by precision, the error should be similar, as the
;; operations will preserve about as many "significant figures" (or rather,
;; something like them as represented in the computer's formats). It does mean
;; we have less precision with this method; however, it is more general.

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- 1.0 (/ guess (improve guess x)))) 0.001))

