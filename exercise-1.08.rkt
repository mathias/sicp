#lang planet neil/sicp

; SICP Exercise 1.08

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))
(define (square x)
  (* x x ))

(define (good-enough? guess x)
  (< (abs (- 1 (/ guess (improve guess x)))) 0.001))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (cube-root x) 
  (cbrt-iter 1.0 x))