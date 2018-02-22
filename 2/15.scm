;; Exercise 2.15: Evaluation of compounding interval error

;; Results first:
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))

;;(define a (make-center-percent 10 1))
;Value: a
;;(define b (make-center-percent 20 2))
;Value: b
;;(par1 a b)
;Value: (6.361967213114754 . 6.9844067796610165)
;;(center (par1 a b))
;Value: 6.673186996387885
;;(percent (par1 a b))
;Value: 4.663735385230335
;;(par2 a b)
;Value: (6.5776271186440685 . 6.7554098360655725)
;;(center (par2 a b))
;Value: 6.6665184773548205
;;(percent (par2 a b))
;Value: 1.3334000200059877
;;(define c (make-center-percent 10 10))
;Value: c
;;(define d (make-center-percent 20 5))
;Value: d
;;(par1 c d)
;Value: (5.34375 . 8.25)
;;(center (par1 c d))
;Value: 6.796875
;;(percent (par1 c d))
;Value: 21.379310344827587
;;(par2 c d)
;Value: (6.107142857142858 . 7.21875)
;;(center (par2 c d))
;Value: 6.662946428571429
;;(percent (par2 c d))
;Value: 8.341708542713564

;; Algebraically, the centers should be 20/3 and par2 gets closer on both
;; pairs tested here. However, before we declare either procedure “better”,
;; we should notice something doesn’t smell right about getting less
;; error on the result than on one of the terms, which had a fairly serious
;; swing of 10%. After all, the par2 procedure involves more calculations and
;; introduces a perfect zero-width term.

;; In short, I do not think Eva is right. Despite the off-center answer, you
;; are better off increasing the tolerance and understanding that neither the
;; original nor the resulting intervals necessarily represent uniform
;; probability distributions.
