;; Exercise 1.39: Implement an approximation of the tangent function using a
;;                k-term finite continued fraction (Lambert's 1770 expansion)

(define (cont-frac n d k)
  (define (iter i res)
    (if (= i 0)
      res
      (iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter (- k 1) (/ (n k) (d k))))

;; approximation of TAN based on Lambert's formula
(define (tan-cf x k)
  (let ((nx2 (- (square x))))
    (cont-frac (lambda (i) (if (= i 1)
                             x
                             nx2))
               (lambda (i) (- (* i 2) 1))
               k)))
