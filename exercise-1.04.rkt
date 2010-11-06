#lang planet neil/sicp

; SICP Exercise 1.04
; Obvserve that our model of evaluation allows for combinations who operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; if b is positive (b > 0), the plus sign operator is returned, computing (+ a b)
; if b is negative (b < 0), the minus is return, meaning that the computation is (- a b) or (if b is negative) an equation of a minus negative-b, which is like a + abs(b) where abs() is absolute value.

; Running the function with some sample data, we can see this in operation:
;> (a-plus-abs-b 1 -3)
; 4
;> (a-plus-abs-b 1 3)
; 4