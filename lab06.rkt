#lang racket

;zad 24
(define (double x) (* x 2))
(define (cube x) (* (* x x) x))

(define (plus x y . l) (apply + x y l))
(define (plus2 x y . l)
  (define (helper acc l)
    (if (empty? l)
        acc
        (helper (+ acc (car l)) (cdr l))))
  (helper (+ x y) l))
        
(plus2 2 3 4)

(define (par . func)
  (define (returnedFunc x)
    (define (helper func (acc '()))
      (if (empty? func)
          acc
          (helper (cdr func) (append acc (list ((car func) x)) ))))
    (helper func))
  returnedFunc)

((par double double cube) 3)

;zad 28
(define (make-konto balance)
  (define (add x)
    (set! balance (+ balance x)))
  (define (check)
    balance)
  (define (withdraw x)
    (set! balance (- balance x)))
  (add 10)
  (add 10)
  (withdraw 5)
  (check))

(make-konto 0)


(define (add x y) (+ x y))
(define (check balance) balance)
(define (withdraw x y) (- x y))

(define (make-konto2 balance passw)
  (define (helper func . l)
    (if (eq? (last l) passw)
        (if (eq? (cdr l) '())
               (func balance)
            (set! balance (func balance (car l))))
        (error "bad pasw")))
  helper)

(define konto (make-konto2 0 'password))
(konto add 10 'password)
(konto check 'password)
;(konto add 10 'another-password)
(konto withdraw 5 'password)
(konto check 'password)

;zad29

(define (counting-version f)
  (let ((acc 0))
    (lambda (x)
      (cond ((eq? x 'how-often) acc)
            ((eq? x 'reset) (and (set! acc 0) acc))
            (else (begin
                    (set! acc (+ acc 1))
                    (f x)))))))
(define counter (counting-version double))
(counter 5)
(counter `how-often)
(counter 5)
(counter `how-often)
(counter `reset)