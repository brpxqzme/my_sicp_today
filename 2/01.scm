;; Exercise 2.1: Sign-aware rational number constructor

;; The prompt may make it sound otherwise, but only the denominator needs to
;; be checked for correction.
(define (make-rat n d)
  (if (negative? d)
    (make-rat (- n) (- d))
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g)))))

;; The refactor could be done in a let instead of recursing, but I decided to
;; heed the part about "wishful thinking" found in this section.
