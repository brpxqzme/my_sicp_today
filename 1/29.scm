;; Exercise 1.29: Using higher order procedures

;; givens
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (cube x) (* x x x))

;; implementation of simpson's rule approximation of an integral from a to b
;; once again, let would be good to have, but I'm trying to approach this as
;; a newbie.
(define (simpson f a b n)
  (define (h)
    (/ (- b a) n))
  (define (y k)
    (f (+ a (* k (h)))))
  (define (skip n)
    (+ n 2))
  (* (/ (h) 3)
     (+ (y 0)
        (* 4 (sum y 1 skip (- n 1)))
        (* 2 (sum y 2 skip (- n 2)))
        (y n))))

;; (simpson cube 0.0 1.0 100)
;Value: .25000000000000006
;; (simpson cube 0.0 1.0 1000)
;Value: .2500000000000002

;; It integrates closely enough to .25 that we seem to be running into floating
;; point errors more than mathematical ones. Using integer bounds gives "1/4".
;; A different approach to the summation could (would!) give slightly different
;; floating point error, including multiplying individual terms by 2 and 4 or
;; using the sum procedure from exercise 30.
