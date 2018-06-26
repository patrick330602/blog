---
title: Prolog Notes
mathjax: true
---

## Intro

Prolog is a logic language designed by a group around Alain Cotmeraver in Marsaille and first implemented by Philippe Rousell in 1972. The logic programming begin with **SL Algorithm**, which is developed by Robert Kowalski and Anthony Robinson. It has the following logic behavior:

$$\forall x \ b_1(x)\land b_2(x)\land \ldots \land b_n(x) \to h(x) \equiv \forall x \ \neg b_1(x)\lor \neg b_2(x)\lor \ldots \lor \neg b_n(x) \lor h(x)$$

or more simple,

$$a\to b\equiv \neg a \lor b$$

<!--more-->
In 1972, a group around Alain Cotmeraver developed the idea of **Robinson's SLDNF Rwsolution**.

The algorithm consists of followings:

- Logic
  - Propositional(e.g., Aristotle)
  - Predicate
    - Objects
    - Variables
    - Predicates
    - Operators(e.g., $\forall\ \exists\ \lnot\ \land\ \lor$)

and it have a operator $vDash$ with following sequence:

$theory \vDash consequence$

For example:

$$\begin{case} &\forall x\ man(x)\to mortal(x)\\ &man(x)\end{case}\vDash mortal(aristotle)$$

With this algorithm, "**Pro**gammation en **log**ique" is born.

## Syntax

- Objects: `apple`, `aristotle`
- Variables: `X`, `Fruit`, `Var` (Everything that has first letter capitalized)
- Predicates: red, human
- Terms: red(apple), human(X), friend(X, aristotle)
- Lists: act as objects, reference like `[H|T]` with `H` head and `T` Tail.

## Rule

$T_1 \vDash \ T_2, T_3, T_4,\ldots, T_n.$
where $T_i$ are terms

Example:

$\text{mortal}(x)\vDash \text{human}(x) \equiv \forall x\ \text{mortal}(x)\to \text{human}(x)$

Sample Code:

```prolog
cat(bob).
dog(tom).
snake(monty).

animal(X):- cat(X).
animal(X):- dog(X).
animal(X):- snake(X).

likes(henry, X):- animal(X),
            \+ snake(X).
```