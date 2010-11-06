#lang planet neil/sicp

(define (square x) (* x x))

(define (sum-of-squares x y) 
  (+ (square x) (square y)))

; Exercise 1.03:
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
(define (sum-of-larger-squares x y z)
  (cond
   ((and (>= x y) (>= y z)) (sum-of-squares x y))
   ((and (>= y x) (>= x z)) (sum-of-squares x y))
   ((and (>= x y) (>= z y)) (sum-of-squares x z))
   (else (sum-of-squares y z))))
