;; Exercise 1.30: Redefining a given higher order procedure

;; fill-in-the-blanks task complete
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))
