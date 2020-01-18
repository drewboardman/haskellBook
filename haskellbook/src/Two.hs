-- let x = 5; y = 6 in x * y
module Two where

multi = x * y
  where
    x = 5
    y = 6
-- let x = 3; y = 1000 in x * 3 + y

mult2 :: Integer
mult2 = x * 3 + y
  where
    x = 3
    y = 1000

mult3 :: Integer
mult3 = x * 5
  where
    y = 10
    x = 10 * 5 + y

mult4 :: Double
mult4 = z / x + y
  where
    x = 7
    y = negate x
    z = y + 10

sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

byThree :: Int -> Int
byThree x = x * 3
