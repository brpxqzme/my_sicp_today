;; Exercise 1.18: Multiplication in logarithmic time using shifting (the
;;                "Russian peasant method")

(define (mult-iter a b)
  (define (double n)
    (* 2 n))
  (define (halve n)
    (/ n 2))
  (define (mult a b acc)
    (cond ((= b 0) acc)
          ((even? b) (mult (double a) (halve b) acc))
          (else (mult a (- b 1) (+ a acc)))))
  (mult a b 0))
