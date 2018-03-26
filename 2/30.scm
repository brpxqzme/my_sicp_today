;; Exercise 2.30: Applying logic to each leaf of a tree

;; First part: using no higher-order procedures
(define (square-tree tree-element)
  (cond ((null? tree-element) tree-element)
        ((not (pair? tree-element)) (* tree-element tree-element))
        (else (cons (square-tree (car tree-element))
                    (square-tree (cdr tree-element))))))

;; Second part: using map
(define (square-tree-2 tree-element)
  (map (lambda (element)
         (if (pair? element)
           (square-tree-2 element)
           (* element element)))
       tree-element))
