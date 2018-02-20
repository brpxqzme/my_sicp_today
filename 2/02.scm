;; Exercise 2.2: Making abstract data that itself uses abstract data

;; Segment constructor
(define (make-segment start end)
  (cons start end))

;; Segment selectors
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

;; Point constructor
(define (make-point x y)
  (cons x y))

;; Point selectors
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

;; Point display (given in book)
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Procedure using compound data procedures: midpoint of line segment
(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment))
        (midaxis (lambda (a b) (/ (+ a b) 2))))
    (make-point (midaxis (x-point start) (x-point end))
                (midaxis (y-point start) (y-point end)))))
