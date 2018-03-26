;; Exercise 2.32: Fill-in-the-blank: all subsets of a set

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))
;;;;;;;;;;;;;;;;;;;;;;; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;; simple cases:
;; (subsets '())
; (())
;; (subsets '(1))
; (() (1))
;; (subsets '(1 2))
; (() (2) (1) (1 2))

;; With the subsets of '(a), it is inevitable that (subsets (cdr s)) will
;; translate to (subsets '()), so appending '(()) and '((1)) is the desired
;; behavior, and what needs to be mapped to get '((a)) out of '(()) should
;; involve the (car s) somehow. Therefore, prepending (cons-ing) it to each
;; element of the subsets of the cdr works for at least the case of a set of
;; size 1.

;; If subsets works for a set of size N-1, the append statement joins the
;; subsets of size N-1 which except the first element and include the others
;; to the subsets of size N which are all those but with the first element
;; included. This means that subsets works for a set of size N including the
;; first element if it works for a set of size N-1. Furthermore, the  nature of
;; the recursive call to subsets is such that every first element will be a car
;; until the call is of size 1 or less.

;; Therefore, by (an informal, somewhat poorly specified) induction, this
;; produces all subsets of a given set for any size set of 1 or greater. Also,
;; the size 0 was a given, so I did not really need to establish size 1, but it
;; should show how one might infer a working answer.

;; The exercise asks for a “clear” explanation, however, which I suppose the
;; above does not qualify as. In simpler terms, the answer can be divided into
;; equal halves, one which contains a given element in the set and one which
;; does not. Do this with each element and you get the reverse of the process
;; needed to build up to the answer.
