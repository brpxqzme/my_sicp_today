;; Exercise 1.10: Ackermann's function and low orders thereof

(define (A x y)
        (cond ((= y 0) 0)
              ((= x 0) (* 2 y))
              ((= y 1) 2)
              (else (A (- x 1) (A x (- y 1))))))

;; (A 1 10)
;; (A 0 (A 1 9))
;; (* 2 (A 1 9))
;; (* 2 (A 0 (A 1 8)))
;; (* 2 (* 2 (A 1 8)))
;; (* 4 (A 1 8)) ;; constant reapplication of (A 0 y) in else case
;; (* 8 (A 1 7))
;; (* 16 (A 1 6))
;; (* 32 (A 1 5))
;; (* 64 (A 1 4))
;; (* 128 (A 1 3))
;; (* 256 (A 1 2))
;; (* 512 (A 1 1)) ;; (A x 1)
;; (* 512 2)
;; 1024
;; (A 1 x) is equivalent to 2 to the power of x for positive integer x.

;; (A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2))))
;; (A 1 (A 1 4))
;; (A 1 16)
;; 65536
;; (A 2 x) is equivalent to 0 exponentiated by 2 x times for positive integer x.

;; (A 3 3)
;; (A 2 (A 3 2))
;; (A 2 (A 2 (A 3 1)))
;; (A 2 (A 2 2))
;; (A 2 4)
;; 65536

;; f computes n*2
;; g computes 2^n
;; h computes 2^2^... where the number of 2s is n.
