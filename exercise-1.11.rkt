#lang planet neil/sicp

; SICP Exercise 1.11
; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. 

; Write a procedure that computes f by means of a recursive process.
(define (f n) 
  (cond ((< n 3) n)
        ((or (> n 3) (= n 3)) 
         (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

; (f 2)
; 2
; (f 3)
; 4
; (f 4)
; 11
; (f 5)
; 25

(define (>= a b)
  (or (> a b) (= a b)))

; Write a procedure that computes f by means of an iterative process.

;; Notes: After trying for hours to write this (and consulting with others), 
;; I came upon a simple solution:
;;
;; First, write down what the procedure needs for each iteration:
;; f(n) = (previous state) + 2 * (previous-previous state) + 3 * (previous-previous-previous state)
;; so if we keep track of the last 3 steps and count upwards, we can start with f(1), f(2) being known.
;; f(a b c) = a + 2b + 3c
;; where a = (n-1), b = (n-2), c = (n-3)
;; f(1) = 1
;; f(2) = 2
;; then we get past special cases and keep feeding the result into a:
;; f(3) = f-iter(2 1 0) = 2 + 2*1 + 3*0 = 4
;; now a = 3, b = 2, c = 1 and the count = 4
;; f(4) = f-iter(4 2 1) = 4 + 2*2 + 3*1 = 11
;; now a = 11, b = 4, c = 2
;; f(5) = f-iter(11 4 2) = 11 + 2*4 + 3*2 = 25
;; etc.
;; You'll notice we're not keeping track of the value of n in f(n), 
;; so we'll need a variable as a counter.

(define (f-iterative n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))

(define (f-iter a b c count)
  (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) 
;;            ( this is f(n) in the previous state (n-1)
              a b 
;;            previous two states
              (- count 1))))
;;            (decrement the count each time until it is less than 3)

;; Tested and working solution.
 