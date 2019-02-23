Haskell Book
------------

## Exercises to revisit
* Ch4 exercise 4 (pg 112)
* Ch5 Currying types (pg 138)

## Chapter 2
* everything is an expression or declaration
  - expressions evaluate to a result
  - declarations are just top-level bindings that allow you to name expressions

## Chapter 4
`(==) :: Eq a => a -> a -> Bool`
* Here the `Eq a => a` is a *type constraint*
  - this means that the `a` is a *type variable* and it must implement the `Eq`
    *type-class*

## Chapter 5
* What's the benefit of currying?
  - when all functions really just take one input and return one result, you can
    re-use things easier
* When there is a lowercase letter in a type signature, it is a *type variable*
  and it is polymorphic
  - `id :: a -> a`

Real World Haskell
-----------------------
## Compiling with `ghc`
* when you compile a `hs` file with something like `ghc -c MyFile.hs`, you get
  two new files:
    - `MyFile.hi` - this is an interface file
    - `MyFile.o` - this is an object file

Generics
------------
* [sawse](http://www.stephendiehl.com/posts/generics.html)
* Generics are a form of *datatype-generic* programming
* A sum type, is a data structure used to hold a value that could take on several different, but fixed, types. For example:

```haskell
data Pastry
  = Turnover
  | Macaroon
  | Brownie
  | Cookie
```
