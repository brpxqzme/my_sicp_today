;; Exercise 2.20: Dotted tail notation (arbitrary number of parameters)

;; Return a list containing elements with the same even-odd parity as the first
;; argument given. It is assumed that all arguments are whole numbers to play
;; nice with Scheme’s parity procedures.
(define (same-parity head . tail)
  (let ((parity? (if (even? head) even? odd?)))
    (cons head (filter parity? tail))))

;; In the spirit of the chapter, the filter could be spelled out:
(define (same-parity-2 head . tail)
  (let ((parity? (if (even? head) even? odd?)))
    (define (tailfilter tail)
      (if (null? tail)
        tail
        (if (parity? (car tail))
          (cons (car tail) (tailfilter (cdr tail)))
          (tailfilter (cdr tail)))))
    (cons head (tailfilter tail))))
