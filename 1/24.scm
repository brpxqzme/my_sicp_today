;; Exercise 1.24: Evaluating performance of a probabilistic process

;; code from the book, taken as a given
(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 5000)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
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
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;; procedure to search for primality of integers in a range
(define (search-for-primes lower-bound upper-bound)
  (cond ((even? lower-bound) (search-for-primes (+ lower-bound 1) upper-bound))
        ((> lower-bound upper-bound) 'nil)
        (else (timed-prime-test lower-bound)
              (search-for-primes (+ lower-bound 2) upper-bound))))

;; This exercise did not specify how many times the Fermat test should be run.
;; The text states that the probability of error can be "made as small as
;; we like", and with that in mind, I have arbitrarily chosen 5000 tests.

;; With theta of log n growth, we might expect the time to roughly double for
;; each squaring of n.

;; 1009 *** .12999999999999545
;; 1013 *** .12999999999999545
;; 1019 *** .14000000000001478
;; 1000003 *** .19999999999998863
;; 1000033 *** .21000000000000796
;; 1000037 *** .19999999999998863
;; 1000000000039 *** .46000000000000796
;; 1000000000061 *** .46000000000000796
;; 1000000000063 *** .46999999999999886
;; 1000000007 *** .3400000000000034
;; 1000000009 *** .3300000000000125
;; 1000000021 *** .3299999999999841
;; 1000000000000000003 *** .6799999999998363
;; 1000000000000000009 *** .6700000000000728
;; 1000000000000000031 *** .6900000000000546

;; It would appear that the growth in time is not that simple, but if you
;; squint it's at least clear that doubling is good for one sig fig!

;; Something important to note here is that I did not choose a very large
;; number of test iterations. Since the number of instructions executed in a
;; test iteration is random (in logarithmic proportion to the random number
;; chosen), we can expect more deviation from the "true" average run time than
;; if I'd used far more iterations--refer to the Law of Large Numbers.

(define (runtests)
  (define (nexttest a)
    (if (null? a)
      a
      (begin (timed-prime-test (car a))
             (nexttest (cdr a)))))
  (nexttest '(1009 1013 1019
              1000003 1000033 1000037
              1000000000039 1000000000061 1000000000063
              1000000007 1000000009 1000000021
              1000000000000000003 1000000000000000009 1000000000000000031)))
