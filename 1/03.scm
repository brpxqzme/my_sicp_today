;; Exercise 1.3: Procedure that takes three arguments and returns the sum of
;;               squares of the two largest.

;; Using only techniques and primitives covered in the chapter. There is more
;; than one way to approach this even with that restriction (e.g. place
;; the summation inside the conditionals to only square twice).

(define (sum-of-squares-of-two-largest x y z)
  (+ (square x) (square y) (square z)
     (- (square (least-of-three x y z)))))
(define (least-of-three x y z)
  (if (< x y)
    (if (< x z) x z)
    (if (< y z) y z)))
(define (square x)
  (* x x))
