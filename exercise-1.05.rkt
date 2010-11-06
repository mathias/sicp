#lang planet neil/sicp

; Exercise 1.05
; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaulation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; He then evaluates the expression

(test 0 (p))

; in Applicative-Order evaluation, the p calls itself indefinitely, which means the program never gets to the if statement within the test function.
; In normal-order evaluation, the program has not yet computed p (which would call itself indefinitely) and we're only really looking at the x value in the test, which is 0.
; 0 == 0 so the test should return a 0.

; DrRacket is using applicative order evaluation because it never returns a 0, it simply hangs until stopped while expanding p forever.