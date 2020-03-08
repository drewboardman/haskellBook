# Haskell from first principles

Applicative
-----------
* `Applicative`s are *monoidal functors*
* A good way to think about this is using `Monoid` and function application
  operator `($)`

```haskell
mappend :: f -> f -> f
($)     :: (a -> b) -> a -> b
```

If you combine these two together, you get ap `(<*>)`. You have two `f`
(applicatives) and you get back another `f`. But you also have the embedded
signature of function application operator `$`.

```haskell
(<*>) :: f(a -> b) -> f a -> f b
```

One interesting side note is that two-tuple instance of `Applicative` requires
`Monoid` for the left argument `a`.

```haskell
instance Monoid a => Applicative ((,) a)
```

This is because `mappend` is used to determined the left hand side when app'd

```haskell
instance Monoid a => Applicative ((,) a) where
pure x            = (mempty, x)
(u, f) <*> (v, x) = (u `mappend` v, f x)
```

```haskell
-- Sum 2 <> Sum 0 = Sum 2
Prelude> (Sum 2, (+1)) <*> (Sum 0, 0)
(Sum {getSum = 2},1)

-- Product 3 <> Product 2 = Product 6
Prelude> (Product 3, (+9))<*>(Product 2, 8)
(Product {getProduct = 6},17)
```

Another functionality of thinking about `Applicative` as Monoidal Functors is
with `liftA2`

```
(+) <$> [1,2] <*> [3,5]
-- becomes
[(1+), (2+)] <*> [3,5]
[4, 6, 5, 7]

import Control.Applicative

-- recall the signature of liftA2
liftA2 :: (a -> b -> c) -> f a -> f b -> f c
liftA2 (+) [1,2] [3,5]
[4, 6, 5, 7]
```
