;; Exercise 1.46: Generalizing the iterative improvement method used in
;;                much of this chapter

;; This procedure returns a procedure that uses the arguments to test and
;; iterate on its own argument.

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
      guess
      ((iterative-improve good-enough? improve) (improve guess)))))

;; The version of SQRT from section 1.1.7 rewritten to use ITERATIVE-IMPROVE

(define (sqrt-ii x)
  (define (good-sqrt x)
    (lambda (guess) (< (abs (- (square guess) x)) 0.001)))
  (define (improve-sqrt x)
    (lambda (guess) (average guess (/ x guess))))
  ((iterative-improve (good-sqrt x) (improve-sqrt x)) 1.0))

;; FIXED-POINT from section 1.3.3 rewritten to use ITERATIVE-IMPROVE

(define (fixed-point-ii f first-guess)
  (define tolerance 0.00001)
  (define (close-enough f)
    (lambda (guess)
      (< (abs (- guess (f guess))) tolerance)))
  ((iterative-improve (close-enough f) f) first-guess))

;; since this is not a convincing demonstration in itself, here is another
;; SQRT that uses this fixed-point procedure:

(define (sqrt-fp x)
  (fixed-point-ii (lambda (y) (average y (/ x y))) 1.0))

;; Given from the book
(define (average x y)
  (/ (+ x y) 2))

;; (sqrt-ii 25)
;Value: 5.000023178253949
;; (sqrt-fp 25)
;Value: 5.000000000053722
;; (sqrt-ii 81)
;Value: 9.000011298790216
;; (sqrt-fp 81)
;Value: 9.000000000007091

