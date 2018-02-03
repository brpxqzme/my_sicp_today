;; Exercise 1.25: A key difference between mathematical expression and
;;                process: performance becomes an issue

;; Although this suggestion is simpler to understand and mathematically
;; equivalent, it would (and does) perform much worse. The primary reason is
;; that the computations to handle large, exponential-scale numbers are
;; in themselves prohibitive while not saving steps (in the sense that it has
;; the same logarithmic order) compared to using the recursive expmod, which
;; calculates the modulus at every step, keeping the size of the numbers down.
