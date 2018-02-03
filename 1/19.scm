;; Exercise 1.19: Iterative Fibonacci numbers in logarithmic time

;; Applying T_pq twice gives us, in the original terms:

;; a <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;; b <- (bp + aq)p + (bq + aq + ap)q

;; Refactoring to put these in terms of a and b:
;; a <- bpq + aqq + bqq + aqq + apq + bpq + apq + app
;; a <- 2bpq + bqq + app + 2apq + 2aqq
;; a <- b(2pq + qq) + a(pp + 2pq + 2qq)
;; b <- bpp + apq + bqq + aqq + apq
;; b <- bpp + bqq + 2apq + aqq
;; b <- b(pp + qq) + a(2pq + qq)

;; From the transformation for b, it would appear that:
;; p <- pp + qq
;; q <- 2pq + qq

;; and for peace of mind, we can further refactor the a transformation:
;; a <- b(2pq + qq) + a(pp + 2pq + 2qq)
;; a <- b(2pq + qq) + a(pp + qq) + a(2pq + qq)

;; to confirm that T_p'q' is equivalent to T^2_pq. Given that this p' and q'
;; squares the given transformation (although we have not proven why this is!),
;; we can factor the a and b transformations out and consider this the
;; equivalent of a known T^(2n) to factor out a potentially unknown T^(n/2).
;; Thus, our successive squaring-style algorithm will work as given.

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

