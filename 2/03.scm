;; Exercise 2.3: Different implementations of abstract data that produce the
;;               same results in external procedures

;; constructor and selectors for rectangle with no particular positioning
(define (make-rectangle width height)
  (cons width height))
(define (width-rectangle rectangle)
  (car rectangle))
(define (height-rectangle rectangle)
  (cdr rectangle))

;; procedures to compute perimeter and area
(define (perimeter-rectangle rectangle)
  (* 2 (+ (width-rectangle rectangle) (height-rectangle rectangle))))
(define (area-rectangle rectangle)
  (* (width-rectangle rectangle) (height-rectangle rectangle)))

;; constructor and selectors for different representation of rectangles
;; (axis-aligned rect from diagonal line segment).
(load "02.scm")
(define (make-rectangle-2 segment)
  (make-point (abs (- (x-point (end-segment segment))
                      (x-point (start-segment segment))))
              (abs (- (y-point (end-segment segment))
                      (y-point (start-segment segment))))))
(define (width-rectangle-2 rectangle)
  (x-point rectangle))
(define (height-rectangle-2 rectangle)
  (y-point rectangle))

;; (make-rectangle 3 4)
;Value 2: (3 . 4)
;; (make-rectangle-2 (make-segment (make-point 0 0) (make-point 3 4)))
;Value 3: (3 . 4)
;; the same internal representation is not the relevant matter; it's that
;; both of these will give the same answers from respective width/height
;; selectors and either could give valid answers from perimeter/area procedures
