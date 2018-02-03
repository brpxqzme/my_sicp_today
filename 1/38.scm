;; Exercise 1.38: Implement an approximation of e using a k-term finite
;;                continued fraction (Euler's 1737 expansion)

(define (cont-frac n d k)
  (define (iter i res)
    (if (= i 0)
      res
      (iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (e-approx k)
  (+ (cont-frac (lambda (i) 1.0)
                (lambda (i) (if (= (remainder i 3) 2)
                              (+ (* (/ (- i 2) 3) 2) 2)
                              1))
                k)
     2))

;; (e-approx 20)
;Value: 2.718281828459045

