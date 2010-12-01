#lang planet neil/sicp

; SICP Exercise 1.11
; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. 

; Write a procedure that computes f by means of a recursive process.
(define (f n) 
  (cond ((< n 3) n)
        ((or (> n 3) (= n 3)) (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

; (f 2)
; 2
; (f 3)
; 4
; (f 5)
; 25

; Write a procedure that computes f by means of an iterative process.
