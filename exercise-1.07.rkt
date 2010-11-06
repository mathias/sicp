#lang planet neil/sicp

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

; For very very small numbers, the first guess is too small for our threshold (0.001)
; For very large numbers, 

;(sqrt-iter 1.0 16e48)
;4e+24
;(sqrt-iter 1.0 16e49)
; will never complete
; (Note: I had to get these magic values from github.com/plural/sicp to see where the threshold was)

; It appears that the program never settles on a "good enough" answer with these large values.

;; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the enxt and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

(define (better-good-enough? guess x)
  ; Look at next guess while computing whether current is good enough:
  (< (abs (- 1 (/ guess (improve guess x)))) 0.001))

(define (new-sqrt-iter guess x)
  (if (better-good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x)
                 x)))

; Testing against the old sqrt-iter:
(sqrt-iter 1.0 9)
;3.00009155413138
(new-sqrt-iter 1.0 9)
;3.00009155413138

; Small values:
(new-sqrt-iter 1.0 0.0000016)
;0.0012649910246819984
(new-sqrt-iter 1.0 0.0000000016)
4.0002234572288217e-05

; Large values:
(new-sqrt-iter 1.0 16e48)
;4.0005045205668744e+24
(new-sqrt-iter 1.0 16e49)
;1.2649233714002964e+25