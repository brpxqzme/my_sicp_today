;; Exercise 1.16: Iterative exponentiation in logarithmic time

(define (iter-expt b n)
  (define (ex b n a)
    (cond ((= n 0) a)
          ((even? n) (ex (square b) (/ n 2) a))
          (else (ex b (- n 1) (* a b)))))
  (ex b n 1))
