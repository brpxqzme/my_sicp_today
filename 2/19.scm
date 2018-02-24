;; Exercise 2.19: Redefining an old example in terms of list operations

;; code given from the book
;; Hm, these denominations are a little dated (´・ω・`)
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount (except-first-denomination coin-values))
             (cc (- amount (first-denomination coin-values)) coin-values)))))

;; Defined as requested. In some Lispen car and cdr are called first and rest,
;; which is more or less the paradigm here.
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

;; The order of coin-values is irrelevant to answer given by the procedure cc.
;; It works by splitting the world into one branch where the current first
;; denomination gets used once and another branch where it will not be used, so
;; the answer will consider every possible way and pay one coin at a time.
;; What is relevant is the time taken by not eliminating the most possibilities
;; up front:
;(let ((t (runtime))) (cc 51 uk-coins) (display (- (runtime) t)))
;.8900000000000006
;(let ((t (runtime))) (cc 51 (reverse uk-coins)) (display (- (runtime) t)))
;3.960000000000001

;; One caveat: if you duplicated a denomination, the answer would be different
;; because it would be correctly treated like a separate kind of coin:
;(cc 193 '(1)) ; pennies
;Value: 1
;(cc 193 '(1 1)) ; Lincoln memorial and wheat pennies
;Value: 194
;(cc 193 '(1 1 1)) ; Lincoln memoral, wheat, and shield pennies
;Value: 18915
