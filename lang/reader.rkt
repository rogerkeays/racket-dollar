#lang racket/base

;; by naming this file lang/reader.rkt, racket will automatically load it when #lang dollar
;; is used (where 'dollar' is the package name)

;; readers must export these three methods
(provide read read-syntax get-info)

;; create a readtable that maps $ to , (unquote) 
(define readtable (make-readtable #f #\$ #\, #f))

;; this procedure wraps the given procedure to use our modified readtable
(define (wrap-readtable proc)
  (λ args (parameterize ([current-readtable readtable]) (apply proc args))))

;; contains make-meta-reader which does all the heavy lifting
(require syntax/module-reader)

;; generate the required #lang procedures wrapped with our readtable
(define-values (read read-syntax get-info)
  (make-meta-reader
    'dollar
    "parent language"          ;; used for error reporting if no parent language is used with #lang
    lang-reader-module-paths   ;; this procedure finds the reader for the parent language
    wrap-readtable             ;; wrapper for read
    wrap-readtable             ;; wrapper for read-syntax
    wrap-readtable))           ;; wrapper for get-info

