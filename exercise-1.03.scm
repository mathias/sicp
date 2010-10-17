#lang planet neil/sicp

; SICP exercise 1.3

; return the square of a given number
(define (square x)
  (* x x))

; given two numbers, return the sum of their squares
(define (sum-of-squares x y)
  (+ (square x) (square y)))

; given three numbers, return the sum of the squares of the largest 2
(define (sum-of-squares-largest x y z)
  (cond 
    ((and (>= x z) (>= y z)) (sum-of-squares x y))
    ((and (>= x y) (>= z y)) (sum-of-squares x z))
    ((and (>= y x) (>= z x)) (sum-of-squares y z))))
