;; Exercise 1.12: Procedure to compute elements of Pascal's triangle

;; start counting from row/col 1
;; two base cases: at top of pyramid (1) and outside it (0)
(define (pascal row col)
  (cond ((and (= row 1) (= col 1)) 1)
        ((or (< col 1) (> col row)) 0)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

;; logically, (r-1,c-1) is "up and to the left", and (r-1,c) is "up and to the
;; right" for this system.
