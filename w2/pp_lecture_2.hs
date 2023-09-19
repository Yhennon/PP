{-
 In Haskell, a function is a mapping that takes one or more arguments
 and produces a single result, and is defined using an equation that
 gives a name for the function, a name for each of its arguments, and
 a body that specifies how the result can be calculated in terms of the arguments.
-}

l1 = [1, 4, 5, 6]

l2 = ["some", "bizarre", "mango"]

l3 = [1, 2, 3, 4]

-- function that multiplies elements of a list by two
multiply [] = []
multiply (x : s) = [2 * x] ++ multiply (s)

-- Function that returns the second element of a list
second [] = 0
second (x) = x !! 1

second' [] = 0
second' (x) = head (tail x)

-- Show how the library function 'last' that selects
-- the last element of a list can be defined using the functions introduced in the lecture

-- $ last l1 will return 6

myLast (xs) = xs !! (length xs - 1)

-- or
myLast2 (xs) = head (reverse xs)

-- an example with div (notice the backticks) which means division
-- n = a `div` length xs
--     where
--         a = 10
--         xs = [1,2,3,4,5]

-- same as the exercise with "last", but now replicate "init"

-- $ init l1 will return [1,2,3]

myInit (xs) = take (length xs - 1) xs

-- or
myInit2 (xs) = reverse (tail (reverse xs))

-- 2^3*4 = (2^3)*4

-- 2*3+4*5 = (2*3) + (4*5)

-- 2+3*4^5 = 2+(3*(4^5))