;; Exercise 1.11: Challenge in iterating an inefficient but naturally stated
;;                recursive function by converting it to an awkwardly stated
;;                but efficient iterative function.

;; recursive version
(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))

;; iterative version
;; the trick to this implementation is approaching the order of additions
;; backwards, so that we count up to the base case and make use of previous
;; results instead of re-doing them.
;; base case is COUNT = N, so only results f(n-1), f(n-2), and f(n-3) are used.
;; otherwise, we imagine we "got called" by a higher count and provide these
;; values to it.
(define (f-iter n)
  (define (f count prev prev2 prev3)
    (if (= count n)
        (+ prev (* 2 prev2) (* 3 prev3))
        (f (+ count 1)
           (+ prev (* 2 prev2) (* 3 prev3))
           prev
           prev2)))
  (if (< n 3)
      n
      (f 3 2 1 0)))
