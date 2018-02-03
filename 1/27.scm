;; Exercise 1.27: Testing known edge cases algorithmically

;; procedure to test every positive a < n for a^n congruent to a%n
;; if true, number is either prime or carmichael
(define (prime-or-carmichael? n)
  (define (try-it a)
    (cond ((= a n) #t)
          ((= (expmod a n n) a) (try-it (+ a 1)))
          (else #f)))
  (try-it 1))

;; (map prime-or-carmichael? '(561 1105 1729 2465 2821 6601))
;Value 4: (#t #t #t #t #t #t)
;; (map prime? '(561 1105 1729 2465 2821 6601))
;Value 5: (#f #f #f #f #f #f)

;; given auxiliary to calculate (base^exp)%m
(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder
           (square
             (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base
               (expmod base (- exp 1) m))
            m))))
