#lang planet neil/sicp

; Comments are expansion steps and then expected output after the line is run. Thanks to plural for coming up with that idea ;)

10
; 10

(+ 5 3 4)
; 12

(- 9 1)
; 8

(/ 6 2)
; 3

(+ (* 2 4) (- 4 6))
; (+ 8 -2)
; 6

(define a 3)
a
; 3

(define b (+ a 1))
b
; 4

(+ a b (* a b))
; (+ a b 12)
; (+ 3 4 12)
; 19

(= a b)
; false

(if (and (> b a) (< b (* a b)))
    b
    a)
; (if (and (> 4 3) (< 4 (* 3 4)))
; (if (and TRUE (< 4 12))
; (if (and TRUE TRUE))
; evaluates to true
; returns b
; 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; (= a 4) => false
; (= b 4) => true
; return (+ 6 7 a)
; return 16
; 16

(+ 2 (if (> b a) b a))
; (+ 2 (if (TRUE) b a))
; (+ 2 b)
; 6

(* (cond ((> b a) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; 16

