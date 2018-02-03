;; Exercise 1.22: Evaluating the time usage of a process with logarithmic
;;                growth in time

;; code from the book, taken as a given
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
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

;; procedure to search for primality of integers in a range
(define (search-for-primes lower-bound upper-bound)
  (cond ((even? lower-bound) (search-for-primes (+ lower-bound 1) upper-bound))
        ((> lower-bound upper-bound) 'nil)
        (else (timed-prime-test lower-bound)
              (search-for-primes (+ lower-bound 2) upper-bound))))

;; The procedure found the three smallest primes greater than 1000 to be
;; 1009, 1013, and 1019. Greater than 10000: 10007, 10009, 10037. Greater
;; than 100,000: 100,003; 100,019; 100,043. Greater than 1,000,000:
;; 1,000,003; 1,000,033; 1,000,037.

;; Every one of these tests ran too quickly to have a time greater than 0
;; using the given procedure. Even if this were not the case, I would be
;; cautious to accept such a routine's results except with the understanding
;; that memory and multitasking OS voodoo (to say nothing of branch prediction,
;; pipelining, CPU throttling, or garbage collection) play non-trivial roles
;; in varying the running time; you the programmer in a high level language
;; have minimal or no control over these particular time-variable operations.

;; In modern times, we are less prone to consider the performance nemesis to be
;; CPU cycles, and more likely to suspect memory access time. Memory has become
;; much slower relative to the CPU (the so-called von Neumann bottleneck), even
;; while advances in CPU speed are meeting challenges. Memory accesses even on
;; a relatively "simple" device we carry on our person may be a cache of a
;; cache of a cache. The device itself is probably capable of multiprocessing
;; and GPGPU computation.

;; But I digress. The results are fully compatible with the -notion- that the
;; run time is in proportion to the number of steps needed for the computation,
;; but they do not support it well (and my computer isn't even that new!).
;; The exercise is not ruined, however. Trying much larger primes (of the order
;; 10^11-10^14):

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

;; We can eyeball that the time taken goes up by a factor of roughly 10 for
;; testing primes roughly 10^2 times the size. We can also calculate that for
;; testing primes roughly 10 times the size, the factor is roughly the square
;; root of 10 (.43 * 3.16 ~= 1.36). So, the prediction of theta of the square
;; root of n time is very good, if imperfect. It was never going to be perfect;
;; even doing the same calculations twice, the times are not consistent between
;; runs because conditions cannot be kept identical.

