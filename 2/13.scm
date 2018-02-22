;; Exercise 2.13: Deriving an approximation of tolerances of a product of
;;                intervals

;; In the case of positive bounds, the product of two intervals is the interval
;; between the product of the lower bounds and the product of the upper bounds:
; (a_l * b_l, a_u * b_u)

;; In terms of absolute tolerances:
; ((a - a_t) * (b - b_t), (a + a_t) * (b + b_t))
; (a*b - a*b_t - b*a_t - a_t*b_t, a*b + a*b_t + b*a_t + a_t*b_t)

;; This makes the product:
; a*b ± (a*b_t + b*a_t + a_t*b_t)

;; Under the assumption of small tolerances, the term a_t*b_t is yet smaller.
;; For instance, a 5% tolerance, which might be large to some applications,
;; would still be an imperceptible 0.25%. Therefore, for approximation
;; purposes, it is appropriate to eliminate this term.
; a*b ± (a*b_t + b*a_t)

;; To get the proportion, then, divide by the interval center:
; a*b_t/(a*b) + b*a_t/(a*b)
; b_t/b + a_t/a

;; Remembering that these were absolute tolerances to start with, the
;; tolerance over the center is the proportional tolerance. Therefore, the
;; approximate percentage tolerance of a product of intervals with small
;; tolerances is the sum of the terms’ percentage tolerances.
