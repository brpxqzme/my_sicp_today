;; Exercise 2.12: Alternative (percentage tolerance) constructor for intervals,
;;                selector for percentage tolerance

;; Constructors and selectors
(load "10.scm")

;; new given center-based constructors and selectors
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; Constructor for an interval given a percentage tolerance and a center value.
;; Percentage is interpreted "out of 100", as opposed to a proportion.
(define (make-center-percent center percent)
  (let ((half-width (* (abs center) (/ percent 100))))
    (make-interval (- center half-width) (+ center half-width))))
(define (percent i)
  (let ((center-i (center i)))
    (* 100 (/ (- (upper-bound i) center-i) (abs center-i)))))
