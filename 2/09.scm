;; Exercise 2.9: Interval width as function additively but not multiplicatively

;; Given the lower and upper bounds of two intervals a and b:
; a_l, a_u, b_l, b_u
;; the widths are a_u - a_l and b_u - b_l. The interval a + b has lower and
;; upper bounds (a_l + b_l) and (a_u + b_u), and its width is:
; (a_u + b_u) - (a_l + b_l)
; = a_u - a_l + b_u - b_l
;; In other words, the width of a + b is equal to the width of a plus the width
;; of b, making the former a function of the latter. This holds regardless of
;; the sign of b, so it holds for subtraction as well.

;; This does not hold for multiplication; for example, in the case where all
;; bounds are positive numbers greater than or equal to one, the width of the
;; interval will be this difference of the products of bounds:
; a_u*b_u - a_l*b_l
;; There is no factor of either of the original widths (a_u - a_l) or
;; (b_u - b_l) in this difference, hence it is not a function of only the two.

;; Division being implemented with a multiplication, it cannot be a function
;; of only those factors.

