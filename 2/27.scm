;; Exercise 2.27: Tree traversal in an algorithm

(define (deep-reverse l)
  (cond ((null? l) l)
        ((pair? (car l))
         (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))
        (else (append (reverse (cdr l)) (list (car l))))))
