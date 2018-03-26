;; Exercise 2.24: Understanding list tree structure

;; The interpreter gives value (1 (2 (3 4)))

;; The box plot is like this:
;; [v|>]>[v|/]
;;  v     v
;;  1    [v|>]>[v|/]
;;        v     v
;;        2    [v|>]>[v|/]
;;              v     v
;;              3     4

;; The tree representation is like this (note the “list” at each level):
;;         .
;;        / \
;;       1   .
;;          / \
;;         2   .
;;            / \
;;           3   4
