;; Exercise 2.11: Rewriting multiplication to run fewer * operations

;; Constructors and selectors
(load "10.scm")

;; Most people who legitimately have to consider more than three cases struggle
;; to avoid putting it that way in order to keep the logic manageable.
;; Only Nine Cases Ben is not most people.
(define (mul-interval x y)
  (let ((x-l (lower-bound x))
        (x-u (upper-bound x))
        (y-l (lower-bound y))
        (y-u (upper-bound y)))
    (let ((x-l-n (negative? x-l))
          (x-u-n (negative? x-u))
          (y-l-n (negative? y-l))
          (y-u-n (negative? y-u)))
      (if x-l-n
        (if x-u-n
          (if y-l-n
            (if y-u-n
              ;; case 1: -- * --
              (make-interval (* x-u y-u) (* x-l y-l))
              ;; case 2: -- * -+
              (make-interval (* x-l y-u) (* x-l y-l)))
            ;; case 3: -- * ++
            (make-interval (* x-l y-u) (* x-u y-l)))
          (if y-l-n
            (if y-u-n
              ;; case 4: -+ * --
              (make-interval (* x-u y-l) (* x-l y-l))
              ;; case 5: -+ * -+
              (make-interval (min (* x-u y-l) (* x-l y-u))
                             (max (* x-l y-l) (* x-u y-u))))
            ;; case 6: -+ * ++
            (make-interval (* x-l y-u) (* x-u y-u))))
        (if y-l-n
          (if y-u-n
            ;; case 7: ++ * --
            (make-interval (* x-u y-l) (* x-l y-u))
            ;; case 8: ++ * -+
            (make-interval (* x-u y-l) (* x-u y-u)))
          ;; case 9: ++ * ++
          (make-interval (* x-l y-l) (* x-u y-u)))))))

;; but does it run faster?
;(define (do100k f n) (if (< n 100000) (let () (f) (do10k f (1+ n)))))
;(define (time-mul) (let* ((t1 (runtime)) (anon (do10k (lambda () (mul-interval a b)) 0))) (- (runtime) t1)))
;(time-mul) ; old
;Value: .5299999999999998
;(time-mul)
;Value: .52
;(time-mul) ; new
;Value: .3999999999999999
;(time-mul)
;Value: .38000000000000034
;; so, as machine-dependent as this may be, I get 25% off for the ++*++ case
