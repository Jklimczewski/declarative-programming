#lang racket

;zad13
(define (square x) (* x x))
(define (f g) (g 2))
(f square)
;f(g) -> g(2) -> square(2) -> 4

(f (lambda (z) (+ z (* 3 z))))
;f( (z) =>  (+ z (* 3 z)) => f (2) => 8

;(f f)
;szuka zmiennej (funkcji) f ale nie znajduje

;zad14
(define (root f a b) (if (or (= (f (/ (+ a b) 2)) 0) (tolerance (/ (- b a) 2)))
                       (/ (+ a b) 2)
                       (if (> (sign (f (/ (+ a b) 2)) (f a)) 0)
                           (root f (/ (+ a b) 2) b)
                           (root f a (/ (+ a b) 2)))
                       )
  )
(define (sign x y) (* x y))
(define (tolerance x) (if (< x (/ 1 100000)) #t #f))
(root (lambda (x) (- (- (* (* x x) x) x) 2)) 1 2)

;zad15
(define (comb f g) (lambda (x) (f (g x))))

(define (square2 n) (* n n))

(define (double n) (+ n n))

((comb square double) 5)
;evaluation: lambda(5) => square (double 5) => square(10) => 100'

;zad17
(define (appending l m) (if (null? l)
                            m
                            (cons (car l) (appending (cdr l) m))))
(appending '(1 2) '(3 4))

(define (last l) (if (empty? (cdr l))
                     (car l)
                     (last (cdr l))))
(last '(1 2))

(define (reverse l) (if (empty? l)
                        '()
                        (append (reverse (cdr l)) (list (car l)))))
(reverse '(1 2 3 4))

(define (delete x l) (if (empty? l)
                         '()
                         (if (= (car l) x)
                             (delete x (cdr l))
                             (append (list (car l)) (delete x (cdr l))))))
(delete 2 '(2 2 3 4))

(define (deleteAcc x l (tmp '())) (if (empty? l)
                                   tmp
                                   (if (= (car l) x)
                                       (deleteAcc x (cdr l) tmp)
                                       (deleteAcc x (cdr l) (append tmp (list (car l)))))))
(deleteAcc 2 '(2 2 3 4))

(define (pairing l1 l2) (if (or (empty? l1) (empty? l2))
                            '()
                            (append (list (cons (car l1) (car l2))) (pairing (cdr l1) (cdr l2)))))
(pairing '(1 2 3) '(a b c))

(define (splitAcc x l (l1 '()) (l2 '())) (if (empty? l)
                                             (list l1 l2)
                                             (if (< (car l) x)
                                                 (splitAcc x (cdr l) (append l1 (list (car l))) l2)
                                                 (if (> (car l) x)
                                                     (splitAcc x (cdr l) l1 (append l2 (list (car l))))
                                                     (splitAcc x (cdr l) l1 l2)))))
(splitAcc 6 '( 0 23 1 3 1 2 0 1 5 2 2 3 4))