;; Exercise 1.14: Draw the tree for making change for 11 cents, and analyze
;;                the procedure's growth in time and space.

;; (cc 11 5)
;; (cc 11 4) + (cc -39 5)
;;     |       0
;; (cc 11 3) + (cc -14 4)
;;     |       0
;; (cc 11 2) + (cc 1 3)
;;     |       (cc 1 2) + (cc -9 3)
;;     |           |      0
;;     |       (cc 1 1) + (cc -4 2)
;;     |           |      0
;;     |       (cc 1 0) + (cc 0 1)
;;     |       0        + 1
;; (cc 11 1) + (cc 6 2)
;;     |       (cc 6 1) + (cc 1 2)
;;     |           |      (cc 1 1) + (cc -4 2)
;;     |           |          |      0
;;     |           |      (cc 1 0) + (cc 0 1)
;;     |           |      0        + 1
;;     |       (cc 6 0) + (cc 5 1)
;;     |       0       +(cc 5 0) + (cc 4 1)
;;     |                0       +(cc 4 0) + (cc 3 1)
;;     |                         0       +(cc 3 0) + (cc 2 1)
;;     |                                  0       +(cc 2 0) + (cc 1 1)
;;     |                                           0       +(cc 1 0) + (cc 0 1)
;;     |                                                    0        + 1
;; (cc 11 0) + (cc 10 1)
;; (cc 10 0) + (cc 9 1)
;;    ...
;; (cc 1 0) + (cc 0 1)
;;            1

;; The maximum space this tree-recursive process will use is the stack needed
;; to hold the maximum amount of the smallest denomination used. Any larger
;; denomination will reduce the space needed, as even the smallest denomination
;; will be inspected fewer times while recursing. Because the number of times
;; the smallest denomination can be subtracted from n is directly proportional
;; to n, there exists some k1 and k2 such that (* k1 n) ≤ R(n) ≤ (* k2 n) for
;; any n≥1.

;; The maximum time this process will use would be to assume that every
;; denomination needs a number of iterations proportional to the amount n to
;; reach a base case, and each of these iterations repeats the process with
;; one less denomination until the number of denominations is one. That is to
;; say, (cc n 1) is Θ(n), (cc n 2) runs (cc n 1) Θ(n) times making it Θ(n^2),
;; (cc n 3) runs (cc n 2) Θ(n) times making it Θ(n^3), and so forth. We could
;; say that the process has order of growth Θ(n^5), and would be Θ(n^k) if we
;; had k denominations instead. We could also say it was Θ(2^n) to take
;; denominational discretion out of the picture.

;; Visual demonstration:
;; (cc n d) -> (repeat n (cc n (- d 1)))
;; (cc n 5) -> (repeat n (cc n 4))
;;          -> (repeat n (repeat n (cc n 3)))
;;          -> (repeat n (repeat n (repeat n (cc n 2))))
;;          -> (repeat n (repeat n (repeat n (repeat n (cc n 1)))))
;;          -> (repeat n (repeat n (repeat n (repeat n Θ(n)))))
;;          -> (repeat n (repeat n (repeat n Θ(n^2))))
;;          -> (repeat n (repeat n Θ(n^3)))
;;          -> (repeat n Θ(n^4))
;;          -> Θ(n^5)
