;; Exercise 1.43: Write a procedure that creates a procedure that applies
;;                a given procedure a dynamically specified number of times

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (compose f (repeated f (- n 1)))))

;; ((repeated square 2) 5)
;Value: 625

;; The desired result is logically (square (square 5)), so informally:
;; (repeated square 2) ->
;; (compose square (repeated square 1)) ->
;; (compose square (compose square (repeated square 0))) ->
;; (compose square (compose square (lambda (x) x))) ->
;; (compose square (compose square ident)) ->
;; (compose square square) ->
;; (lambda (x) (square (square x))).

;; And,
;; ((lambda (x) (square (square x))) 5) ->
;; (square (square 5)).

