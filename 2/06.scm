;; Exercise 2.6: Procedures that behave as non-negative integers

;; Given definitions for Church numerals
;; It may be easy to guess that these numerals can evaluate to Scheme's
;; integers by passing 1+ as f, then passing 0 as x to its result:
;((zero 1+) 0)
;Value: 0
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; Substitution-rule to get one
;(add-1 zero)
;;^^^^^
;(lambda (f) (lambda (x) (f ((zero f) x))))
;;                            ^^^^
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;;                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;;                          ^^^^^^^^^^^^^^^^^^
;(lambda (f) (lambda (x) (f x)))
(define one (lambda (f) (lambda (x) (f x))))

;; Substitution-rule to get two, although this could be extrapolated from
;; zero and one.
;(add-1 one)
;;^^^^^
;(lambda (f) (lambda (x) (f ((one f) x))))
;;                            ^^^
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;;                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;;                          ^^^^^^^^^^^^^^^^^^^^^^
;(lambda (f) (lambda (x) (f (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;; Addition, therefore, can combine the repeated application of f somehow.
;; We can strip the lambdas by application with appropriate names to substitute
;; for x but keep f the same, then add new lambdas:
; inside-of-left: ((numeral f) inside-of-right)
; inside-of-right: ((right f) x)
(define (add a b)
  (lambda (f) (lambda (x)
                ((a f) ((b f) x)))))

; (((add one two) 1+) 0)
;Value: 3
