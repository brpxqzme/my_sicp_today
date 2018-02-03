;; Exercise 1.41: Writing a procedure that takes and returns a procedure,
;;                then using it on itself

(define (double single)
  (lambda (x)
    (single (single x))))

;; One could run it and find the return value to be 21. We could also do
;; expansion of some kind, to try seeing that the procedure returned by
;; ((double (double double)) inc) increments its argument 16 times.

;; In the following expansion, we substitute as we please and assign meaningful
;; names to lambdas composed of many INCs so that what they do is clear enough
;; to read. It is thus not the exact expansion performed, so much as an
;; informal proof.

;; (double double) ->
;; (lambda (x) (double (double x))).

;; (double (double double)) ->
;; (lambda (x) ((double double) ((double double) x))) ->
;; (lambda (x) ((double double) (double (double x)))) ->
;; (lambda (x) (double (double (double (double x))))).

;; ((double (double double)) inc) ->
;; (double (double (double (double inc)))) ->
;; (double (double (double (lambda (x) (inc (inc x)))))) ->
;; (double (double (double +2))) ->
;; (double (double (lambda (x) (+2 (+2 x))))) ->
;; (double (double +4)) ->
;; (double (lambda (x) (+4 (+4 x)))) ->
;; (double +8) ->
;; (lambda (x) (+8 (+8 x))) ->
;; +16.

;; (+16 5) ->
;; 21.

