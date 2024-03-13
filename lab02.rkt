#lang racket

;zad6
(define (factorial n) (if (> n 1) (* n (factorial (- n 1))) 1))
(factorial 5)
;evaluation: n * n-1 * n-2 ... * 1

(define (factorial_help n i acc) (if (< n i) acc (factorial_help n (+ i 1) (* i acc))))
(define (factorial2 n) (factorial_help n 1 1))
(factorial2 5)
;evaluation: factorial2 n => factorial_help n 1 1 => factorial_help n 2 2 =>
;factorial_help n 3 6 => acc

;zad7
(define (fibonacci n) (if (> n 1)
                          (+ (fibonacci (- n 1)) (fibonacci (- n 2)))
                           n))
(fibonacci 9)
;evaluation: fibonacci 4 => fibonacci 3 + fibonacci 2 => fibonacci 2 + 1 + 1 + 0 =>
;1 + 0 + 1 + 1 + 0

(define (fibonacci2 n) (fibonacci_help n 0 1))
(define (fibonacci_help n i acc) (if (= n 1)
                                     acc
                                     (fibonacci_help (- n 1) acc (+ i acc))))
(fibonacci2 9)
;evaluation: fibonacci 4 => fibonacci_help 4 0 1 => fib_help 3 1 1 => fib_help 2 1 2 =>
;fib_help 1 2 3

;zad8
(define (exp b e) (if (= e 0)
                      1
                      (if (= (remainder e 2) 0)
                          (* (exp b (/ e 2)) (exp b (/ e 2)))
                          (* b (exp b (- e 1))))))
(exp 2 6)
;evaluation: exp 2 6 => exp 2 3 * exp 2 3 => 2 * exp 2 2 * 2 exp 2 2 = 8 * 8 = 64

