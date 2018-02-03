;; Exercise 1.45: Finding how to generalize a procedure, then doing so

;; First, the problem statement directs us to experiment with how many
;; dampings are needed to find the nth root of x as a fixed-point of
;; y maps to x/(y^(n-1))

;; - For square and cube roots, one is sufficient (given).
;; - For fourth through seventh roots, two is sufficent. (for the fourth roots,
;;   this is a given. The others were found by evaluating statements like:
;; (fixed-point (average-damp
;;                (average-damp (lambda (y) (/ 390625 (expt y 7))))) 1.0)
;;   incrementing the value for the second argument of EXPT until the
;;   statement did not return quickly (at which point the safe assumption is
;;   that the method is not converging and the process can be terminated).
;; - For eighth through fifteenth roots, three is sufficient.
;; - For sixteenth through thirty-first roots, four is sufficient.

;; Without understanding why, the apparent pattern is that the number of
;; needed average dampings increases logarithmically. That is, it is equal
;; to the base 2 logarithm of n, rounded down.

;; So, we can make the given cube root fixed-point more general by
;; substituting a REPEATED statement in for the single AVERAGE-DAMP and
;; exponentiating to n-1 in the denominator of the fixed-point equation
;; instead of hardcoding it.

(define (root x n)
  (define (log2i x)
    (truncate (/ (log x) (log 2))))
  (define (average-damps f)
    ((repeated average-damp (log2i n)) f))
  (fixed-point (average-damps (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

;; example: (root 244140625 12)
;Value: 4.999997112673272

;; The problem statement says to assume arithmetic operations are available as
;; primitives. Although EXPT is not introduced in the text (thus far) as one
;; and LOG is mentioned only in passing, I have elected to use them this way
;; seeing as Scheme standards as far back as the R2RS include them both. This
;; solution, of course, may be more or less absurd than simply using EXPT to
;; exponentiate the inverse depending on the implementation....

;; givens from the book
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))
(define (average x y)
  (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

;; From Exercise 1.43
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (compose f (repeated f (- n 1)))))
