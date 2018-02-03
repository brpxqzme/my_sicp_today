;; Exercise 1.23: Evaluating the performance of an optimized algorithm

(define (next n)
  (if (= n 2)
    3
    (+ n 2)))
;; code from the book, modified as requested by the exercise
(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

;; procedure to search for primality of integers in a range
(define (search-for-primes lower-bound upper-bound)
  (cond ((even? lower-bound) (search-for-primes (+ lower-bound 1) upper-bound))
        ((> lower-bound upper-bound) 'nil)
        (else (timed-prime-test lower-bound)
              (search-for-primes (+ lower-bound 2) upper-bound))))

;; again testing larger primes than requested, our previous timings were:

;; 100000000003 *** .4299999999999784
;; 100000000019 *** .4299999999999784
;; 100000000057 *** .4299999999999784
;; 1000000000039 *** 1.3900000000000006
;; 1000000000061 *** 1.3500000000000014
;; 1000000000063 *** 1.3799999999999955
;; 10000000000037 *** 4.280000000000001
;; 10000000000051 *** 4.25
;; 10000000000099 *** 4.310000000000002
;; 100000000000031 *** 13.519999999999996
;; 100000000000067 *** 13.689999999999998
;; 100000000000097 *** 13.89

;; and our new timings are:

;; 100000000003 *** .27000000000001023
;; 100000000019 *** .2599999999999909
;; 100000000057 *** .2599999999999909
;; 1000000000039 *** .8199999999999932
;; 1000000000061 *** .8199999999999932
;; 1000000000063 *** .8199999999999932
;; 10000000000037 *** 2.569999999999993
;; 10000000000051 *** 2.579999999999984
;; 10000000000099 *** 2.5900000000000034
;; 100000000000031 *** 8.299999999999983
;; 100000000000067 *** 8.099999999999994
;; 100000000000097 *** 8.189999999999998

;; If our expectation was that this would take half the time, we should be
;; disappointed; it's more like 60% in practice. The big problem is that
;; although we have significantly reduced the number-crunching, there is no
;; reduction in what we haven't taken out or can't take out, including some
;; introduced overhead from adding a conditional to our iterator, even though
;; it is slight.
