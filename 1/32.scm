;; Exercise 1.32: A next-level higher order procedure

;; ACCUMULATE is nearly a copy-paste job from SUM or PRODUCT, we just specify
;; the identity value and the operation to combine.
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

;; SUM uses additive identity (0) and adds (+)
;; PRODUCT uses multiplicative identity (1) and multiplies (*)
(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))

;; part b, rewrite PRODUCT as recursive
(define (accumulate-r combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (product-r term (next a) next b))))
