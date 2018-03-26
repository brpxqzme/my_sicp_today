;; Exercise 2.28: Flattening list-trees

(define (fringe l)
  (cond ((null? l) l)
        ((pair? (car l)) (append (fringe (car l)) (fringe (cdr l))))
        (else (cons (car l) (fringe (cdr l))))))
