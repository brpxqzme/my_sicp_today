;; Exercise 2.4: A representation of pairs using procedures

;; given these definitions...
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

;; the cons-pair will be a procedure that takes a procedure as its argument
;(cons 'x 'y)
;(lambda (m) (m 'x 'y))
;; and the car of the cons will execute that procedure, passing it a procedure
;; to return the first parameter originally given to cons
;(car (lambda (m) (m 'x 'y)))
;((lambda (m) (m 'x 'y)) (lambda (p q) p))
;((lambda (p q) p) 'x 'y)
;'x

;; Therefore, cdr can be defined very similarly to car to get:
;((lambda (p q) q) 'x 'y)
;'y
(define (cdr z)
  (z (lambda (p q) q)))
