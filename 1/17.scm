;; Exercise 1.17: Software multiplication in logarithmic time

(define (mult a b)
  (define (double n)
    (* 2 n))
  (define (halve n)
    (/ n 2))
  (cond ((= b 0) 0)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult a (- b 1))))))
