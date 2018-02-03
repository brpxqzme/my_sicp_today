;; Exercise 1.20: normal and applicative order with respect to an iterative
;;                procedure in logarithmic time

;; normal-order, with running count of remainder operations performed

(gcd 206 40)
(if (= 40 0)
  206
  (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)
  40
  (gcd (remainder 206 40) 40))
(if (= 6 0)
  40
  (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))) ; 1
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0)
  (remainder 206 40)
  (gcd (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; we can see how many remainder operations are needed for the predicate by
;; counting uses of the word, since this is normal order after all.
(if (= 4 0)
  (remainder 206 40)
  (gcd (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; 2,3
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
  (remainder 40 (remainder 206 40))
  (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
       (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40))))))
(if (= 2 0)
  (remainder 40 (remainder 206 40))
  (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
       (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40)))))) ; 4,5,6,7
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40)))) 0)
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
  (gcd (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40))))
       (remainder (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40)))
                  (remainder (remainder 40 (remainder 206 40))
                             (remainder (remainder 206 40)
                                        (remainder 40
                                                   (remainder 206
                                                              40)))))))
(if (= 0 0)
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
  (gcd (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40))))
       (remainder (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40)))
                  (remainder (remainder 40 (remainder 206 40))
                             (remainder (remainder 206 40)
                                        (remainder 40
                                                   (remainder 206
                                                              40))))))) ;8-14
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
(remainder (remainder 206 40) (remainder 40 6)) ;; 15
(remainder 6 4) ;; 16,17
2 ;; 18

;; So, there are 18 remainder operations performed for normal order evaluation.
;; The calculations are not regarded as "precomputed", but are instead passed
;; on, so they'll be executed again.

;; Applicative order

(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))
(gcd 40 6) ; 1
(if (= 6 0) 40 (gcd 6 (remainder 40 6)))
(gcd 6 (remainder 40 6))
(gcd 6 4) ; 2
(if (= 4 0) 6 (gcd 4 (remainder 6 4)))
(gcd 4 (remainder 6 4))
(gcd 4 2) ; 3
(if (= 2 0) 4 (gcd 2 (remainder 4 2)))
(gcd 2 (remainder 4 2))
(gcd 2 0) ; 4
(if (= 0 0) 2 (gcd 0 (remainder 2 0)))
2

;; With applicative order, parameters to gcd are evaluated before attempting
;; to place them within the body of gcd. Since mathematical substitution
;; applies throughout, the answer is the same despite not performing 14 more
;; ultimately redundant operations.
