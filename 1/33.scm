;; Exercise 1.33: Using yet another higher order procedure to further refine
;;                genericity

(define (filtered-accumulate combiner condition null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (if (condition a)
                       (combiner result (term a))
                       result))))
  (iter a null-value))

;; part a
;; (define (inc x) (+ 1 x))
;; (define (square x) (* x x))
;; (filtered-accumulate + prime? 0 square a inc b)

;; part b
;; (define (relatively-prime? x) (= (gcd n x) 1))
;; (define (identity x) x)
;; (filtered-accumulate * relatively-prime? 1 identity 1 inc (- n 1))
