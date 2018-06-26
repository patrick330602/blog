---
title: Lisp Notes
mathjax: true
---
## TL;DR

This is a note for the original Lisp language using GNU Common Lisp.

<!--more-->

## Intro

Lisp is a functional programming language originally designed by John McCathy in 1958, 
inspired by **Lambda Calculus**(e.g, $f(x)=3x^2+2$) in 30s by Alonzo Church.

This is the first language implementing with **higher-order functions**.

**Higher-order functions** are:

- functions that operate on functions
- functions as parameter
- function as return value

Also, it supports **anonymous functions** with **lambda notation**($\lambda\ \ x.3x^2+2$).

## Syntax

### Expressions

- **atom**: an expression with one or more characters
- **list**: an expression:
  - zero or more expressions
  - seperated by space
  - encosed in parenthesis

| atoms | list | special | special meaning |
| --- | --- | --- | --- |
| banana | (a b c) | t | true |
| apple | (banana apple) |() | false |
| foo | () | `(quote x)` | evaluate to x, can use \' see example 1|
| x | (x 3) |
| 3 | (apple (foo (banana 3) x)) |

example 1:
`(f x y)`: assign x and y to f
`'(f x y)`: a list of f, x and y

expressions have ***value***
- atoms have themselves as value
- lists: `(operator arg1 arg2 arg3 ... argn)`

### functions

- `(atom X)` t if x is an atom () otherwise
- `(eq X Y)` t if x is the same atom as y or x and y are both `'()`, () otherwise
- `(cons X L)` evaluates to a list with X in the head and L as the body, L is a list
- `(list P1 P2 P3 .. Pn)` evaluates to (P1 P2 P3 .. Pn)
- `(car L)` head of the list L
- `(cdr L)` body of the list L

Examples:
```lisp
(eq a b) ;;result:()
(eq a a) ;;result:t
(cons a '(b c)) ;;result:(a b c)
(cons '(a b) '(c d)) ;;result:((a b) c d)
(cons (atom a) (eq b c)) ;;result:(t)
(list a b) ;;result:(a b)
(car '(a b c)) ;;result: a
(cdr '(a b c)) ;;result: (b c)
(cdr '(a)) ;;result: ()
```

### Conditional forms
- `(if X Y Z)` evaluates x: if x returns t, return evaluation of y, else evaluation fo z.
- `(cond (C1 S1) (C2 S2)...(Cn Sn)(t S))` if C1 evaluate to t;evaluate S1 else if C2 evaluate to t;evaluate S2 else....... Cn evaluate to t;evaluate Sn else S

Examples:
```lisp
(if (cdr '(a))
    (car '(a b c))
    (list a b c)) ;;(a b c)
 ```
 
 ### Funcational forms
- `(lambda (P1 P2 ... Pn) E)`
- `(funcall F (P1 P2 ... Pn))` Applies function F to P1... Pn
- `(defun Name (P1 P2 ... Pn) E)`

### Numeric Operators
- `(+ P1 P2... Pn)`
- `(* P1 P2 ... Pn)`
- `(- P1 P2)`
- `(/ P1 P2)`