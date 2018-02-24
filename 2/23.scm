;; Exercise 2.23: Homebrewed implementation of for-each

(define (for-each procedure items)
  (if (not (null? items))
    ((lambda ()
       (procedure (car items))
       (for-each procedure (cdr items))))))

;; For the exercise, it is implied that the procedure takes one argument.
;; The built in for-each can handle procedures that take more than one.
;; The procedure begin has not been introduced, but the anonymous lambda
;; suffices for sequential execution.
