data Trivial =
  Trivial'

-- "This instance is providing the Eq typeclass *for* the Trivial datatype"
instance Eq Trivial where
  Trivial' == Trivial' = True

data Days =
  M | T | W | Th | F | S | Su
  deriving Show

instance Eq Days where
  M  == M  = True
  T  == T  = True
  W  == W  = True
  Th == Th = True
  F  == F  = True
  S  == S  = True
  Su == Su = True
  _  == _  = False

data Date =
  Date Days Int
  deriving Show

instance Eq Date where
  Date weekday dayInt == Date weekday' dayInt' =
    weekday' == weekday &&
      dayInt' == dayInt
