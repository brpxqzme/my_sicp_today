;; Exercise 1.35: Proof of phi as fixed point, computation thereof and thereby

;; phi = (1 + sqrt(5))/2
;; it is a fixed point if f(phi) = phi
;; (1 + sqrt(5))/2 = 1 + 1/((1 + sqrt(5))/2) ; substitute phi into both sides
;; (1 + sqrt(5))/2 = 1 + 2/(1 + sqrt(5))     ; resolve RHS double inversion
;; 1 + sqrt(5) = 2 + 4/(1 + sqrt(5))         ; cancel out 2 (*)
;; 1 + 2sqrt(5) + 5 = 2(1 + sqrt(5)) + 4     ; cancel out pesky denominator
;; 6 + 2sqrt(5) = 2 + 2sqrt(5) +  4          ; distribute 2 on RHS
;; 6 + 2sqrt(5) = 6 + 2sqrt(5)               ; resolve additions

;; therefore, phi is a fixed point of x ↦ 1 + 1/x

;; fixed-point, given from the book
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

;; (fixed-point (lambda (x) (+ 1 (/ 1 x))) 2.0)
;Value: 1.6180327868852458
;; for comparison:
;; (/ (+ 1 (sqrt 5)) 2)
;Value: 1.618033988749895
