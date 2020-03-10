module ReaderPractice where

import Control.Applicative
import Data.Maybe

x = [1, 2, 3]
y = [4, 5, 6]
z = [7, 8, 9]

lookup' :: Eq a => a -> [(a, b)] -> Maybe b
lookup' _ [] = Nothing
lookup' k ((x1,x2) : xs) = if (k == x1) then Just x2 else lookup' k xs

xyWith3 = lookup' 3 $ zip x y
