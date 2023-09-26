{-
Use list comprehension to define a function sevens that given an integer k gives us a list of all
natural numbers that are divisible by 7 and are less than k. First find out what its type should be.
-}
-- sevens :: Int k => k -> [n]
-- sevens k
--     | n <= k
--     | n `mod` 7 == 0
--     | otherwise ?

sevens' :: Integral a => a -> [a]
sevens' k = [n | n <- [0 .. k - 1], mod n 7 == 0]

{-

exc 2, copy from slides
when given an integer k, gives us a list of all Pyth. triples, whose largest element is at most k.
-}

lp = (3, 4, 5)

-- pyt :: Int a => a -> [a]
pyt k = [(a, b, c) | a <- [1 .. k], b <- [1 .. k], c <- [1 .. k], a <= b, b < c, a ^ 2 + b ^ 2 == c ^ 2]

-- Another way, that eliminates the need to explicitly say the 'a <= b, b < c" constraints
pyt' k = [(a, b, c) | a <- [1 .. k - 1], b <- [a .. k - 1], c <- [b + 1 .. k], a ^ 2 + b ^ 2 == c ^ 2]

-- Enum type meaning : the type which can be "enumerated", like so [1..k]

{-
exercise 3, copy from slides
-}

headsup :: Eq a => [a] -> Bool
headsup x = head x == head (tail x)

{-
exercise4, copy from slides
-}

-- plonk x y z = x + y + z

-- plonk' _ _ _ x y z = x + y + z

-- plonk'' x y z = \x -> \y -> \z -> x + y + z

plonk = \x -> \y -> \z -> x + y + z

plonk' = \x y z -> x + y + z

{-
exercise 5, copy from slides
-}
-- Example
f x y (u, v) =
  if x == y
    then if u > v then u else v
    else u