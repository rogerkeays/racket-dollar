# dollar

An example #lang extension for racket that uses $ for unquote.

    > (define x 1)
    > `($x 2)
    '(1 2)
    > `(1 $(+ 1 1))
    '(1 2)

## Try It Yourself

This package is available from the racket package catalog, so you can install it using raco:

    $ raco pkg install dollar

Now create a test script and run it:

    $ echo '#lang dollar racket
    (define x 1)
    `($x 2)' > test.rkt

    $ racket test.rkt
    '(1 2)

You can also use racket/base, or any other language that supports the , (unquote) syntax.

## Under The Hood

This language extension is essentially a single file, lang/reader.rkt, which implements the minimum three procedures required for a language: read, read-syntax and get-info. Check the source code for more details.

## Related Resources

For more solutions to your life's problems, [visit the author's website](https://rogerkeays.com)

