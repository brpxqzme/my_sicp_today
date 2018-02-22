;; Exercise 2.8: Defining subtraction for interval arithmetic

;; Constructors and selectors
(load "07.scm")

;; Subtraction of the bounds can be done either by a procedure that looks a
;; lot like addition, or by negating one set and adding, which has the same
;; arithmetic result.
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))
