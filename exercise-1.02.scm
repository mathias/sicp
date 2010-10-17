#lang planet neil/sicp

; example 1.2
; write out the following math expression as scheme
; 5 + 4 +(2 - (3 - (6 + 4/5)))
; ----------------------------
;     3(6 - 2)(2 - 7)

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) 
   (* 3 (- 6 2) (- 2 7)))
