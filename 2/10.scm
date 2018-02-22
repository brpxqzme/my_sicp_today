;; Exercise 2.10: Error signaling

;; Constructors and selectors
(load "08.scm")

;; Improved division that gives an error for undefined division
(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
    (error "Divide by interval spanning 0:" y)
    (mul-interval
      x
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))
