;; Exercise 1.37: Implementing a k-term finite continued fraction (a kind of
;;                formula using stepwise refinement)

(define (cont-frac n d k)
  (define (next i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (next (+ i 1))))))
  (next 1))

;; (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 9)
;Value: .6181818181818182
;; delta: 1.4782943192337417e-4
;; (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
;Value: .6179775280898876
;; delta: 5.646066000719596e-5
;; (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
;Value: .6180555555555556
;; delta: 2.1566805660788724e-5

;; So, we need k=11 to be accurate to four decimal places (in the sense that
;; the result is <=5e-5 off).

;; part b
(define (cont-frac-i n d k)
  (define (iter i res)
    (if (= i 0)
      res
      (iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter (- k 1) (/ (n k) (d k))))

