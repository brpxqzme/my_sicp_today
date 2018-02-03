;; Exercise 1.44: Writing a procedure that creates a procedure that uses a
;;                given procedure, then using that in the previous exercise's
;;                procedure that so as to apply this newly written procedure
;;                to itself a dynamically specified number of times
;;                [in a hole in the bottom of the sea]

;; SMOOTH returns a smoothed version of the given function, i.e. the average
;; of f(x), f(x+dx), and f(x-dx).
(define dx 0.0001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

;; From the previous exercises
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (compose f (repeated f (- n 1)))))

;; To obtain the n-fold smoothed function (smoothing the smoothed function
;; for a total of n smoothings), you use REPEATED with SMOOTH to obtain a
;; procedure that produces the n-fold smoothed function, then you give that
;; the function. Alternatively, use this procedure which does that.

(define (n-fold-smoothed f n)
  ((repeated smooth n) f))
