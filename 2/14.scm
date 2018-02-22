;; Exercise 2.14: Deciphering unexpected differences in algebraically
;;                identical expressions.

;; Right away you can see that dividing an interval by itself does not create
;; a perfect ratio of one to one. The upper bound is slightly higher than the
;; lower bound is low, and the percent tolerance nearly doubles.

;;(define a (make-center-percent 10 1))
;Value: a
;;(div-interval a a)
;Value: (.9801980198019803 . 1.02020202020202)
;;(center (div-interval a a))
;Value: 1.0002000200020003
;;(percent (div-interval a a))
;Value: 1.9998000199979855

;; Dividing an interval by double its center value also does not create a
;; perfect ratio of one to two. In this case, the phenomenon is similar: the
;; upper bound was slightly higher than the lower bound was low, and the
;; percent tolerance is approximately the sum of the original percent
;; tolerances.

;;(define b (make-center-percent 20 2))
;Value: b
;;(div-interval a b)
;Value: (.4852941176470589 . .5153061224489796)
;;(center (div-interval a b))
;Value: .5003001200480193
;;(percent (div-interval a b))
;Value: 2.9994001199759843

;; Fundamentally, if Lem’s contention is that the centers should stay centered,
;; then it is correct. That is not a completely unreasonable assumption; it’s
;; an assumption we run on when we use “sig fig” math, for example.
