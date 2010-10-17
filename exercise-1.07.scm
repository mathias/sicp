#lang planet neil/sicp

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (square x)
    (* x x))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; why does the current method using good-enough? break down for small and large
; numbers?
; For small numbers, things break down because the loop can exit
; before there is any meaningful convergence on the root because the intial guess ends
; up being smaller than the threshold and the function exits.
; original invocation:
;   (sqrt-iter 1.0 16e-8) ; .00000016
;   0.007819325057615187
;   (abs (- 16e-8 (square 0.007819325057615187)))
;   6.0981844356648745e-05
;   Since 6.0981844356648745e-05 is already much smaller than .0001, there is only a single guess made.
;
; Large numbers:
;   (sqrt-iter 1.0 16e48)
;   4e+24
;   (sqrt-iter 1.0 16e49)
;   <<<infinite sadness>>>
 
; The large number situation basically happens because of overflow in the
; square and comparison operations which cause good enough guesses to be thrown
; out after an operation inflates their value and takes them out of the realm of
; our threshold.

; helps to avoid any infinite evaluations by checking how close two guess are
; to each other.
(define (better-than-good-enough? old-guess guess)
  (< (abs (- 1 (/ old-guess guess))) 0.0001))

; this version of the approximation uses the new better-than-good-enough? and a
; peek ahead at the "improved" guess to provide better accuracy for smaller
; numbers and finite answers for larger numbers.
; TODO(jason): how can the results be printed out more easily for debugging?
(define (better-sqrt-iter guess x)
    (if (better-than-good-enough? guess (improve guess x))
        guess
        (better-sqrt-iter (improve guess x)
                          x)))