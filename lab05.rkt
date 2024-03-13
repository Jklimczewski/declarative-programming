#lang racket
;zad18
(define (square-list l (tmp '())) (if (empty? l)
                            tmp
                            (square-list (cdr l) (append tmp (list(* (car l) (car l)))))))
(square-list '(1 2 3 4))

(define (double x) (* x 2))
(define (mapf f l (tmp '())) (if (empty? l)
                            tmp
                            (mapf f (cdr l) (append tmp (list(f (car l)))))))
(mapf double '(1 2 3 4))

(define (pred x) (if (> x 5) #t #f))
(define (filter pred l (tmp '())) (if (empty? l)
                            tmp
                            (if (pred (car l))
                                (filter pred (cdr l) (append tmp (list(car l))))
                                (filter pred (cdr l) tmp))))
(filter pred '(1 25 36 4))

;zad21
;(define values '((x . #f) (y . #t) (z . #f)))
;(define (eval expression values) (if (equal? (car expression) `and)
                                ;     (if (and (expression)
;(define (get-value ())
;(eval '(and y (not x)) values)

;zad22
(define (fold f e l)
  (if (null? l)
      e
      (f (car l) (fold f e (cdr l)))))

(define (prod l)
  (fold * 1 l))

(define (length l)
  (fold (lambda (elem acc)(+ acc 1)) 0 l))

(define (delete x l)
  (fold (lambda (elem acc) (if (= elem x)
                              acc
                              (append (list elem) acc)))
          '() l))

(define (reverse l)
  (fold (lambda (elem acc) (flatten(cons acc elem)))
        '() l))
(define (reverse2 l)
  (fold (lambda (elem acc) (append acc (list elem)))
        '()
        l))

(define (map f l)
  (fold (lambda (elem acc) (append (list (f elem)) acc)) '() l))

(define (filterPred pred l)
  (fold (lambda (elem acc) (if (pred elem)
                               (append (list elem) acc)
                               acc)) '() l))

(define (forall pred l)
  (fold (lambda (elem acc) (if (not (pred elem))
                               #f
                               acc)) #t l))
(define (forall2 pred l)
  (if (empty? l)
      #t
      (and (pred (car l)) (forall2 pred cdr l)))) 

(prod '(1 2 3 4))
(length '(1 2 3 4))
(delete 2 '(1 2 3 4))
(reverse '(1 2 3 4))
(map double '(1 2 3 4))
(filterPred pred '(1 2 3 4 5 6 7))
(forall pred '(9 6 7 8))