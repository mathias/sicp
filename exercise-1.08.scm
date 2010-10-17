#lang planet neil/sicp

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (square x)
    (* x x))

(define (cube-root x)
    (cube-root-iter 1.0 x))

; helps to avoid any infinite evaluations by checking how close two guess are
; to each other.
(define (good-enough? old-guess guess)
  (< (abs (- 1 (/ old-guess guess))) 0.0001))

; this version of the approximation uses the new better-than-good-enough? and a
; peek ahead at the "improved" guess to provide better accuracy for smaller
; numbers and finite answers for larger numbers.
; TODO(jason): how can the results be printed out more easily for debugging?
(define (cube-root-iter guess x)
    (if (good-enough? guess (improve guess x))
        guess
        (cube-root-iter (improve guess x)
                          x)))

