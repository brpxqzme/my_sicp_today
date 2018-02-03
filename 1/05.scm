;; Exercise 1.5: Comparing applicative-order and normal-order evaluation of
;;               the same expression.

;; The applicative-order evaluation would never complete (at least, in reality,
;; until the interpreter reaches its duly appointed limits). It would keep
;; trying to evaluate the operand (P) before applying it to the operator, and
;; it would keep getting (P) back, leaving the statement permanently at
;; (TEST 0 (P)).

;; The normal-order evaluation would expand the procedure first, into
;; (IF (= 0 0) 0 (P)). It can be expanded no further at this level, so it will
;; evaluate the special form IF. The predicate can be expanded no further, so
;; it will be evaluated to #T. As IF is a special form with the behavior given
;; in the problem statement, only the consequent is evaluated, which gives the
;; value 0. The alternative is not evaluated.
