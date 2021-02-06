#lang dollar racket

(module+ test
  (require rackunit)
  (define x 1)
  (check-equal? `(,x 2) '(1 2))
  (check-equal? `($x 2) '(1 2))
  (check-equal? `(1 ,(+ 1 1)) '(1 2))
  (check-equal? `(1 $(+ 1 1)) '(1 2)))

