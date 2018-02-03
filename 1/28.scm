;; Exercise 1.28: Implementing a slightly better, slightly more complex test
;;                for primeness

;; returns square of a mod m, or 0 if a is a nontrivial square root of 1 modulo
;; m. (let would be preferable to redundant uses of remainder, but it has not
;; yet been covered in the book).
(define (squaremod a m)
  (if (and (not (= a 1))
           (not (= a (- m 1)))
           (= (remainder (square a) m) 1))
    0
    (remainder (square a) m)))

;; calculates base^exp%m, or 0 if a nontrivial square root of 1 modulo m is
;; discovered.
(define (miller-expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (squaremod
           (miller-expmod base (/ exp 2) m) m))
        (else
          (remainder
            (* base
               (miller-expmod base (- exp 1) m))
            m))))

(define (rabin-test n)
  (define (try-it a)
    (= (miller-expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (rapid-prime? n times)
  (cond ((= times 0) true)
        ((rabin-test n) (rapid-prime? n (- times 1)))
        (else false)))

;; NB: my completion of this code does not demonstrate that I understand the
;; math it uses, only that I believe it works as the exercise says it will.

;;;; some carmichael numbers:
;; (map fast-prime? '(561 1105 1729 2465 2821 6601)
;;                  '(500 500 500 500 500 500))
;Value 8: (#t #t #t #t #t #t)
;; (map rapid-prime? '(561 1105 1729 2465 2821 6601)
;;                   '(500 500 500 500 500 500 500))
;Value 9: (#f #f #f #f #f #f)

;;;; some known primes:
;; (map fast-prime? '(100003 100019 100043) '(500 500 500))
;Value 10: (#t #t #t)
;; (map rapid-prime? '(100003 100019 100043) '(500 500 500))
;Value 11: (#t #t #t)

;;;; some known non-primes:
;; (map fast-prime? '(100005 100021 100041) '(500 500 500))
;Value 12: (#f #f #f)
;; (map rapid-prime? '(100005 100021 100041) '(500 500 500))
;Value 13: (#f #f #f)
