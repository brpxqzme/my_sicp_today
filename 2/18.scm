;; Exercise 2.18: Procedure to reverse a list (helper with accumulator)

;; Attempt 1: This is pretty nasty from a perspective of each call to append
;; being O(N), but it’s seemingly what the book primed us to do.
(define (reverse l)
  (if (null? l)
    l
    (append (reverse (cdr l)) (list (car l)))))

;; We can reverse using an accumulator parameter in a helper. Did you remember
;; accumulation was covered in chapter 1? Well, I didn’t, but it didn’t stop
;; being a thing. It’s an important enough concept that I simply used it.
(define (reverse l)
  (define (reverser l a)
    (if (null? l)
      a
      (reverser (cdr l) (cons (car l) a))))
  (reverser l '()))

;; You can find examples of both of these implementations on the Internet
;; reinvented by many people.
