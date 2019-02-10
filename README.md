## Exercises to revisit
* Ch4 exercise 4 (pg 112)
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
  - when all functions really just take one input and return one result, you can re-use things easier
