;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Module that evalutates an arithmetic expression as a parsed syntax object ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(module calc-expander racket

  ;; Creates a reference to the current namespace:
  ;; (https://stackoverflow.com/questions/20778926/mysterious-racket-error-define-unbound-identifier-also-no-app-syntax-trans)
  (define-namespace-anchor anc)
  (define ns (namespace-anchor->namespace anc))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Procedures exported from module ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (provide calc-expander)

  ;; Evalutes arithemetic expression for a given syntax object
  (define (calc-expander stx)
    ;; "Expands" syntax object returned from brag brparse
    (eval stx
     ;; Eval requires a namespace to have access to procedures used for resolving an expression:
     ns))

  ;;;;;;;;;;;;;;;;;;;;;;
  ;; Local Procedures ;;
  ;;;;;;;;;;;;;;;;;;;;;;
  
  ;; Returns the result of an evaluated expression as a string prepended by "=":
  (define (EXP exp) (string-append "=" (number->string exp)))

  ;; Retruns string digit as char:
  (define (DIGIT str) (string-ref str 0))

  ;; Returns a number from a list of chars
  (define (NUM . args)
    ;; If number is negative, appends minus char before converting to number:
    (if (equal? (car args) "-")
        (string->number (list->string (cons #\- (cdr args))))
        (string->number (list->string args))))

  ;; Procedure for applying addition to any number of arguments:
  (define (ADD . args)
    (foldr
     (lambda (result arg) (+ arg result))
     (car args)
     (cdr args)))

  ;; Procedure for applying subtraction to any number of arguments:
  (define (SUB . args)
    (foldr
     (lambda (result arg) (- arg result))
     (car args)
     (cdr args)))

  ;; Procedure for applying multiplication to any number of arguments:
  (define (MUL . args)
    (foldr
     (lambda (result arg) (* arg result))
     (car args)
     (cdr args)))

  ;; Procedure for applying division to any number of arguments:
  (define (DIV . args)
    (foldr
     (lambda (result arg) (/ arg result))
     (car args)
     (cdr args)))
)