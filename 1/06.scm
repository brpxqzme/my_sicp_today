;; Exercise 1.6: Why can't you define IF as a procedure?

;; Because applicative order will be used, NEW-IF will need the result of the
;; next SQRT-ITER, which itself will need the next result, and so forth.
;; Alyssa will not get her answer, even if the initial guess is right on!

;; This would not happen with the special form IF, as it will skip the
;; evaluation of the alternative if the predicate is satisfied. That is the
;; desired behavior; what Alyssa wanted was for the procedure to stop looking
;; once it found an answer.
