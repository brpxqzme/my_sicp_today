;; Exercise 2.17: cdr-ing through an entire list

;; The input is supposedly non-empty, so all there is to it is to cdr until
;; the list passed contains only the last element.
(define (last-pair l)
  (let ((next (cdr l)))
    (if (null? next)
      l
      (last-pair next))))
