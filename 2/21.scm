;; Exercise 2.21: Basic use of map (functional thinking)

;; Fill in the blanks code (MIT/GNU Scheme provides square; YMMV)

;; blank 1: must modify head of list
;; blank 2: must modify rest of list
(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items))
          (square-list (cdr items)))))
;; blank 1: must be a procedure that squares items
;; blank 2: must be the list to which the procedure will be mapped
(define (square-list items)
  (map square items))
