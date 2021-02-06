# racket-dollar

Example #lang for racket that uses $ for unquote.

    > (define x 1)
    > `($x 2)
    '(1 2)
    > `(1 $(+ 1 1))
    '(1 2)

