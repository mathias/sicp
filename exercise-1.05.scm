#lang planet neil/sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; What happens for the following code in normal-order and applicative-order
; evaluations?
;   (test 0 (p))
;
; For normal-order evaluation, the function will be applied before all of the
; arguments are expanded, which allows the special form if to short circuit
; the infinite loop calling (p) would cause.
; The expansion and evaluation is along these lines:
;   (if (= x 0) 0 (p))
;   (if (#f) 0 (p))
;   0 
; (p) in normal-order remains unexpanded until its value is needed.
;
; In applicative-order evaluation, the values are expanded before the if
; function is applied, causing p to continue to expand infinitely.
