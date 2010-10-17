#lang planet neil/sicp

; if b is positive, the expression is a + b, if b is negative, the expression
; is a - b, which is the same as a + abs(b)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
