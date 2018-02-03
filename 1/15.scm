;; Exercise 1.15: Order of growth of a sine approximation

;; a. Let's evaluate through substitution and find out.

;; (sine 12.15)
;; (p (sine 4.05))
;; (p (p (sine 1.35)))
;; (p (p (p (sine 0.45))))
;; (p (p (p (p (sine 0.15)))))
;; (p (p (p (p (p (sine 0.05))))))
;; (p (p (p (p (p 0.05)))))

;; So, p is applied 5 times, as that is how many times 12.15 must be divided by
;; 3.0 to be equal to or less than 0.1.

;; b. The process is not tail recursive, as the program is written in a doubly
;; recursive style. Therefore, the space required is directly proportional to
;; the number of applications of p (which have to be stored in the stack).

;; The number of steps is log base 3 of (a*10) rounded up. This is the reverse
;; operation of dividing a by 3 multiple times to reach 0.1 or lower (itself
;; being inverse exponentiation of 3).

;; So, the order of growth in space as well as time is logarithmic.
