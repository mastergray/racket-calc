;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Calc  | A program that takes an infix arithmetic expression from command line input         ;;
;;        | and returns the result of evalutating that expression back to the command line.     ;;
;;        |                                                                                     ;;
;;        | Features:                                                                           ;;
;;        | - Arithmetic expressions are parsed using a BNF grammar (thanks to BRAG)            ;;
;;        | - Supports +, -, /, *, (, and ) operations                                          ;;
;;        | - Supports decimal numbers                                                          ;;
;;        | - Typing "q" stops the program                                                      ;;
;;        |                                                                                     ;;
;;        | Notes:                                                                              ;;
;;        | - Any run-time error that gets thrown will cause the program to terminate           ;;
;;        | - Decimal results are only returned from decimal inputs                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#lang racket

;; Dependencies:
(require "calc-reader.rkt")   ;; Transforms an arithmetic string into a parsed syntax object
(require "calc-expander.rkt") ;; Evaluates an arithmetic expression as a parsed syntax object
(require readline/readline)   ;; Handles command line I/0

;; Defines program for entering an expression from command line:
(define (main input)
  (cond
    ;; Enter "q" stops the progam:
    [(equal? input "q") (displayln "Done.")]
    (else
      ;; Prints output of calc-expander from command line input:
      (displayln (calc-expander (calc-reader input)))
      ;; Gets ready for next expression to calculate from command line:
      (main (readline "? ")))))

;; Starts main program:
(displayln "Calculate Something... (enter \"q\" to quit)")
(main (readline "? "))