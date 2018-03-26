;; Exercise 2.31: Genericizing a map over tree leaves

(define (tree-map procedure tree)
  (map (lambda (element)
         (if (pair? element)
           (tree-map procedure element)
           (procedure element)))
       tree))
