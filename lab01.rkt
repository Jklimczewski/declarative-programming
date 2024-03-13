#lang racket

;zad2
(define (new.< x y) (< x y))
(new.< 3 4)
(define (new.> x y) (< y x))
(new.> 3 4)
(define (new.= x y) (and (not (< y x)) (not (< x y))))
(new.= 4 4)
(define (new.<= x y) (not (< y x)))
(new.<= 3 4)
(define (new.>= x y) (not (< x y)))
(new.>= 3 4)
(define (new.<> x y) (or (< y x) (< x y)))
(new.<> 3 4)

;zad3
(define (nwd a b) (if (= (remainder a b) 0) b (nwd b (remainder a b))))
(nwd 282 78)
(define (nww a b) (/(* a b)(nwd a b)))
(nww 24 36)

;zad4
(define (odd? n) (if (= (- n 1) 0) "odd" (even? (- n 1))))
(define (even? n) (if (zero? (- n 1)) "even" (odd? (- n 1))))
(odd? 11)

;zad5
(define (same-values? p1 p2 x y) (if (equal? (p1 x y) (p2 x y)) #t #f))
(same-values? + * 2 3)