;; Exercise 2.5: Procedures that behave as a pair using a single integer for
;;               the data

;; Because 2 and 3 are prime numbers, an integer can encode two non-negative
;; integers as powers (factors) thereof and retrieve the encoded integers
;; by factorization.

(define (cons a b)
  (let ((aexp (expt 2 a))
        (bexp (expt 3 b)))
    (* aexp bexp)))

(define (factor divisor dividend)
  (if (not (= (remainder dividend divisor) 0))
    0
    (+ 1 (factor divisor (/ dividend divisor)))))

(define (car a)
  (factor 2 a))
(define (cdr a)
  (factor 3 a))
