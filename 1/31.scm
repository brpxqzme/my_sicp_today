;; Exercise 1.31: Writing a different higher order procedure

;; just like summation, but identity is 1
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc x) (+ x 1))

(define (factorial n)
  (define (identity x) x)
  (product identity 1 inc n))

;; n is number of successive iterations for a closer approximation
(define (pi n)
  (define (term x)
    (if (odd? x)
      (/ (+ x 1) (+ x 2))
      (/ (+ x 2) (+ x 1))))
  (* 4.0 (product term 1 inc n)))

;; part b, rewrite PRODUCT as recursive
(define (product-r term a next b)
  (if (> a b)
    1
    (* (term a)
       (product-r term (next a) next b))))
