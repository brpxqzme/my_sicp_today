;; Exercise 2.22: The ordering of recursive cons

;; The first attempt reverses the order because the way he uses his iterator,
;; with the cons-ing inside the arguments, will prepend each item as it is
;; proc-’d, which is not what Louis was hoping to do.

;; The second attempt does not work as intended because a cons pair needs a
;; specific structure in order to form a flat list: the car as an element,
;; the cdr as a pointer to another list. This is instead the car as a list,
;; and the cdr as an element, so the appearance will be of nested cons pairs.
