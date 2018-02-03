;; Exercise: 1.13: Prove that Fib(n) is the closest integer to phi^n/sqrt(5).

;; (I feared this proof beyond my ken, but I was fortunate to have had
;; inductive proofs drilled into my head at some point. I have chosen to
;; make the proof a little informal for the sake of some brevity.)

;; First, let us prove that Fib(n) = (phi^n - psi^n)/sqrt(5) for the cases
;; n = 0 and n = 1 found in our definition of Fibonacci numbers.

;; Fib(0) is defined as 0.
;; (phi^0 - psi^0)/sqrt(5) = (1 - 1)/sqrt(5)
;;                         = 0.

;; Fib(1) is defined as 1.
;; (phi^1 - psi^1)/sqrt(5) = ((1 + sqrt(5))/2 - (1 - sqrt(5))/2)/sqrt(5)
;;                         = ((1 - 1 + sqrt(5) + sqrt(5))/2)/sqrt(5)
;;                         = ((2 * sqrt(5))/2)/sqrt(5)
;;                         = sqrt(5)/sqrt(5)
;;                         = 1.

;; Does the statement hold true for the next rule for some base case?
;; Fib(2) = Fib(1) + Fib(0) according to our definition, so Fib(2) = 1 + 0 = 1.
;; The statement says Fib(2) = (phi^2 - psi^2)/sqrt(5). At this point we should
;; recall that phi^2 = phi + 1 from the text. The same can be said of psi:
;; ((1 - sqrt(5))/2)^2 = (1 - sqrt(5))/2 + 1;
;; ((1 - 2*sqrt(5) + 5)/4) = (1 - sqrt(5))/2 + 1;
;; ((6 - 2*sqrt(5))/4) = (1 - sqrt(5))/2 + 1;
;; 6 - 2*sqrt(5) = 2 - 2*sqrt(5) + 4;
;; 6 - 2*sqrt(5) = 6 - 2*sqrt(5). Back to Fib(2), though:
;; Fib(2) = (phi^2 - psi^2)/sqrt(5);
;;        = (phi + 1 - (psi + 1))/sqrt(5);
;;        = (phi - psi)/sqrt(5);
;;        = 1 (as shown with Fib(1)).
;; Therefore, the statement is true for the lowest value of n that the rule
;; applies to.

;; We'll be a little stuck without also noticing that phi^2 = phi + 1 and
;; psi^2 = psi + 1 implies that if we multiply or divide these equivalences
;; by phi or psi appropriately, phi^(n+1) = phi^n + phi^(n-1).

;; Now we examine whether the statement holds true for Fib(n+1) if it holds
;; true for some Fib(n) and Fib(n-1). The rule would say:
;; Fib(n+1) = Fib(n) + Fib(n-1). So, if it's true,
;; (phi^(n+1) - psi^(n+1))/sqrt(5) = (phi^n - psi^n)/sqrt(5) +
;;                                   (phi^(n-1) - psi^(n-1))/sqrt(5);
;; phi^(n+1) - psi^(n+1) = phi^n - psi^n + phi^(n-1) - psi^(n-1)
;;                       = phi^n + phi^(n-1) - psi^n - psi^(n-1)
;;                       = phi^(n+1) - psi^(n+1).
;; Therefore, if the statement is true for some Fib(n) and some Fib(n-1),
;; it is true for n+1.

;; As the statement is true for n=2 and n=1, it is true for all n > 2.

;; Finally, to prove that Fib(n) is the nearest integer to (phi^n)/sqrt(5),
;; we must prove two things: that (phi^n - psi^n)/sqrt(5) is an integer, and
;; that it is the nearest.

;; The first part can be proven using another induction, that for every
;; phi^n - psi^n it can be expanded to (phi^(n-1) + phi^(n-2)) -
;; (psi^(n-1) + psi^(n-2)) in a recursive fashion until the factors being
;; expanded produce a phi^1 - psi^1 (which divided by sqrt(5) is an integer 1,
;; the cascading sums of which are integers).
;; [The formal proof of this would be a pain to write, so I have not.
;; The informal view of this would have obviated the need for the proof I have
;; given; we could see it was equivalent in action to the naïve implementation
;; of the n≥2 rule. This, however, does not seem to be in the spirit of the
;; exercise given in the book.]

;; Finally, since the difference between (phi^n)/sqrt(5) and
;; (phi^n-psi^n)/sqrt(5) is (psi^n)/sqrt(5), we can use another induction to
;; show that |psi| is less than one (it's .618...) and to any power it will
;; therefore always be less than one, and 1/sqrt(5) is less than .5, so
;; anything less than 1/sqrt(5) is less than .5, so psi^n/sqrt(5) is less
;; than .5 for any n≥0 and thus has no bearing on what integer (phi^n)/sqrt(5)
;; is closest to considering that (phi^n-psi^n)/sqrt(5) is an integer.
