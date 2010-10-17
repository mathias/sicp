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
    (< (abs (- (square guess) x)) 0.001))

(define (square x)
    (* x x))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; Alyssa P. Hacker wants an if without a special form using the new-if
; definition below and her friend Eva Lu Ator writes new-if for her as follows:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))


; Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter-alyssa guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-alyssa (improve guess x)
                            x)))

(define (sqrt-alyssa x)
  (sqrt-iter-alyssa 1.0 x))

; what will happen when calling (sqrt-alyssa 4) is that the program will never
; terminate because cond is not a special form and will require all of its
; arguments to be evaluated before itself can be evaluated and the
; sqrt-iter-alyssa calls will keep running forever.