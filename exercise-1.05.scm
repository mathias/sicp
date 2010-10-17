#lang planet neil/sicp

(define (p) (p))

; in Normal-order evaluation, an invocation of (test 0 (p)) would loop
; infinitely as the interpreter would evaluate the value of y before
; evaluating the if statement. In applicative-order evaluation, the value
; of y is never calculated if x is 0, so the (test 0 (p)) evaluates to 0.
; Dr. Racket uses Normal-order evaluation, so the method will loop forever. 
(define (test x y)
  (if (= x 0)
    0
    y))
