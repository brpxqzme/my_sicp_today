;; Exercise 2.29: Using a non-homogeneous tree structure

;; Code given in book
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;; 29a: selectors
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

;; 29b: procedure that navigates a recursive structure to sum up weights
(define (total-weight mobile)
  (if (not (pair? mobile))
    mobile
    (let ((l (branch-structure (left-branch mobile)))
          (r (branch-structure (right-branch mobile))))
      (+ (total-weight l) (total-weight r)))))

;; 29c: procedure that navigates a recursive structure to check balance
(define (is-balanced? mobile)
  (define (torque branch)
    (* (branch-length branch) (total-weight (branch-structure branch))))
  (if (not (pair? mobile))
    #t
    (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
         (is-balanced? (branch-structure (left-branch mobile)))
         (is-balanced? (branch-structure (right-branch mobile))))))

;; 29d: if cons had been used instead of list in the constructors, I would need
;;      to change cadr to cdr in right-branch and branch-structure. There would
;;      be no change to the logical shape of the tree, only the amount of
;;      indirection used (and an increase in characters used in displaying the
;;      underlying structure).
