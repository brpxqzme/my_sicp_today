;; Exercise 1.40: Writing a procedure that returns a procedure

(define (cubic a b c)
  (lambda (x)
    (+ (expt x 3)
       (* a (square x))
       (* b x)
       c)))

;; some givens from the book

;; FIXED-POINT takes some F that eventually gives a closer guess of what
;; value you want to find given the current guess over and over. It stops
;; when two guesses are within the defined TOLERANCE. The true answer, which
;; we get closer to, is thus a "fixed point" where x maps to f(x) and you can
;; stop feeding the x back in.
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

;; DERIV takes G and returns a procedure that approximates the derivative of
;; G at an X it is given. DX is used in this approximation.
(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

;; NEWTON-TRANSFORM takes G and returns a procedure for use in Newton's method,
;; finding a zero of a function by finding the fixed point where x maps to
;; x less G(x) over its derivative (instantaneous change) at x. The "thing
;; that makes this work"--on our level and not Newton's--is that we're hoping
;; for G(x) getting smaller and smaller until it's basically 0 and there's no
;; change, dampening whatever changes are introduced by the derivative.
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;; testing: seems to find the zeroes well enough

;; (newtons-method (cubic 1 2 3) 1)
;Value: -1.2756822036498454
;; ((cubic 1 2 3) -1.2756822036498454)
;Value: 4.935607478273596e-12

;; (newtons-method (cubic 1 1 1) 1)
;Value: -.9999999999997796
;; ((cubic 1 1 1) -.9999999999997796)
;Value: 4.4075854077618715e-13
;; (-1)^3 + 1*(-1)^2 + 1*-1 + 1 = -1 +1 - 1 + 1 = 0

;; (newtons-method (cubic 2 1 0) 1)
;Value: 7.102843470195077e-14
;; ((cubic 2 1 0) 7.102843470195077e-14)
;Value: 7.102843470196085e-14
;; (0)^3 + 2*(0)^2 + 1*0 + 0 = 0

