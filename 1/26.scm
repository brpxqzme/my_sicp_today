;; Exercise 1.26: Another key difference between mathematical expression and
;;                processes: order of evaluation affects performance

;; The generous hint "Eva Lu Ator" is why Louis' version of expmod grows
;; linearly. His explicit multiplication ensures that duplicate calls to
;; expmod will be made whenever the exponent is even, because the evaluator
;; must evaluate both arguments before multiplying.

;; It is precisely these redundant calls that were eliminated to make a
;; logarithmic algorithm. To clarify: Rather than divide the problem size by
;; half on even exponents, his version divides the problem size by half, but
;; then does it twice.
