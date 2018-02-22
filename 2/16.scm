;; Exercise 2.16: Structure and interpretation of mathematical estimation

;; Equivalent algebraic expressions can lead to different answers in light of
;; error because the different methods used to arrive at them should be
;; expected to compound the error in different ways. I could draw an analogy
;; to floating-point math, but better writers and mathematicians have written
;; many things on that topic.

;; My analogy would be to an application where interval estimations are
;; relevant and exact results can be found: damage over time in role-playing
;; games. Usually, this can be accurately interpreted as a center value with
;; a tolerance, uniformly but randomly distributed. Using interval addition
;; alone, you could be forgiven for believing that many trials should yield an
;; interval ranging anywhere from the sum of all worst results to the sum of
;; all best results; those are the technical limits.

;; However, very basic statistics would have us know that you should expect
;; something like a bell curve distribution. And when some extra factors are
;; thrown in, as is the case with the rules of most interesting games, you
;; quickly start getting into the kind of statistics where the ways to get
;; plausible answers is either to only consider expected value or to run
;; Monte Carlo simulations.

;; As the book notes, this problem is very difficult. It isn’t just the math
;; that is a problem, but also getting useful interpretations.
