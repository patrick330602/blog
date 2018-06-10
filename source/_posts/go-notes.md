---
title: GoLang Notes
date: 2018-04-25 14:11:55
tags:
- GoLang
mathjax: true
---

## TL;DR

This is a note for programming language GoLang including brief background and syntax.

<!--more-->

## Intro

GoLang is a general purpose programming language that is created under motivation that "C++ is messy" and "no extraneous garbage should be put into the language for any reason".

GoLang do not have attribute of OOP including Encapsulation, Inheritance and most part of Polymorphism.

GoLang is built with concurrent & parallel programming.

## Types

- general: `bool`, `string`, `byte`
- integer: `int`, `int8`, `int16`, `int32`, `int64`
- unsigned integer: `uint`, `uint8`, `uint16`, `uint32`, `uint64`, `uintptr`
- float: `float32`, `float64`

## Syntax
The style of variable is `var <name> <type>` or we can use `:=`
```go
var c, python, java bool
var i,j int = 1,2
k := 3
s := "hello"
//initialize zero with 0, false, or ""
const Pi = 3.14 //constant
//explicit conversion
var i int=64
var f float32=float32(i)

//Arrays
var a [2]string
a[0] = "Hello"
a[1] = "World"

//Struct
type Vertex struct{
    X int
    Y int
}
var v = Vertex{1,2}
v.X = 4
w := {1,2}
```

## Statements

```go
//If statement
if x < 0 {
    x = 1
}

if k := foo(); k < i{
    i = i + 1
}

if x < 0 {
    x = 1
} else {
    x = 2
}

//For statement
sum := 0

for i := 0; i < 10 ; i++ {
    sum += i
}

//switch statement

switch fruit {
    case "apple":
        fmt.PrintIn("red")
    case "banana":
        fmt.PrintIn("yellow")
    default:
        fmt.printf("unknown")
}
switch {
    case t.Hours() < 12:
    case t.Hours() < 12:
    default:

}
```

## Function

```go
func add(a,b int) int {
    return a+b
}

```

multiple returns is allowed:

```go
func swap(x,y string) (string, string){
    return y,x
}

```

you can also return the named variables:

```go
func action(sum int) (x,y int){
    x = sum *2-1
    y = sum-2
    return
}
```

## OOP in GoLang

Assume we want to implement a class `Vertex`:

```cpp In C++
class Vertex
{
    float x,y;
    float foo(){return x+y;}
}
```

```go In GoLang
type Vertex struct {
    x,y float
}

func (v Vertex) foo() float{
    return v.x+v.y
}
```

This will allow GoLang to execute code like this:

```go
v := Vertex{3,4}
x := v.foo()//result: 7
```

Also, pointer receiver is allowed:

```go
func (v *Vertex) Scale(f float64){
    v.x = v.x * f
    v.y = v.y * f
}
v.Scale(10)//result: v.x = 30, v.y=40
```

**Interfaces** : A collection of method signatures

```go
type fooer interface {
    foo() float64
}

func bar(x fooer){
    y := x.foo()
}
```

## Concurrent Programming

### Slices and Range

```go
a[low:high]
var a = []int{1,2,4,8,16,31,64,128}
var sa = a[3:]

func main(){
    for i,v := range sa {
        fmt.Printf("s at %d = %d\n", i,v)
    }
}
```

### Concurency

```go go routines
func main() {
    go foo(x,y,z)
    bar()
}
```

here, `foo()` and `bar()` is running concurrently.

```go channels
ch := make(chan int)
ch <- v
v := <- ch
```

```go Example 2
func sum(s []int, c chan int) {
    sum := 0
    for _, v := range s {
        sum += v
    }
    c <- sum // send sum to c
}

func main() {
    s := []int{7, 2, 8, -9, 4, 0}

    c := make(chan int)
    go sum(s[:len(s)/2], c)
    go sum(s[len(s)/2:], c)
    x, y := <-c, <-c // receive from c

    fmt.Println(x, y, x+y)
}
```