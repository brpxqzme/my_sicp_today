;; Exercise 1.42: Writing a procedure that returns the composition of its
;;                function arguments

(define (compose f g)
  (lambda (x) (f (g x))))

;; ((compose square 1+) 6)
;Value: 49

;; Yes, it was supposed to be this easy.
