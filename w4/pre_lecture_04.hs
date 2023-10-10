-- The goal today:
-- 1. Always be able to tell if a function os polymorphic or overloaded.
-- 2. Do the exercises.
-- Chapter 4 : Defining Functions

-- Functions can be defined using conditional expressions:
-- (Never mind that Prelude already defines abs
-- Notice that you dont need to write return for the true/false cases. Also, an
-- if-then-else expression must always have an else branch.
abs :: Int -> Int
abs n = if n >= 0 then n else -n

-- Conditional expressions can be nested:
signum :: Int -> Int
signum n =
  if n < 0
    then -1
    else if n == 0 then 0 else 1

-- As an alternative to conditional expressions, functions can also be defined using guarded equations:

abs1 n
  | n >= 0 = n
  | otherwise = -n

signum' n
  | n < 0 = -1
  | n == 0 = 0
  | otherwise = 1

-- Pattern matching
-- Functions can often be defined in many different ways using pattern matching. For example here are two definiions of &&:
-- (&&) :: Bool -> Bool -> Bool
-- True && True = True
-- True && False = False
-- False && True = False
-- False && False = False

-- Can be defined more compactly:
-- True && True = True
-- _ && _ = False

-- However, this second definition is more efficient because it avoids evaluating the second argument if the first argument is False. This is called short circuit evaluation.Also, if the first value is True, then the second value is returned, otherwise the first value is returned.

-- True && b = b
-- False && _ = False

-- Notes about pattern matching:
-- Patterns may not repeat variables
-- Patterns are matched in order:
--      _ && _ = False
--      True && True = True
--      always returns False.
{-
Pattern Types:
1. List Patterns
- funtions on lists can be  defined using x:xs patterns, where x is the head of a list and xs is the tail.

- x:xs  patterns only match non-empty lists.

- x:xs patterns must be parenthesised, because application has priority over (:). For example, the following definition is not valid:
head x:_ = x

-
-}
{- Lambda functions
1. Why are lambdas useful?
Lambda expressions can be used to give a formal meaning to functions defined using currying. For example, instead of writing
add:: Int -> Int -> Int
add x y = x + y

we can equivalently write
add:: Int -> (Int -> Int)
add = \x -> (\y -> x + y)

Lambda expressions can be used to avoid naming functions that are only referenced once.

For example:

odds n = map f [0..n-1]
    where
        f x = x*2 + 1

Can be simplified to:
odds n = map (\x -> x*2 + 1) [0..n-1]
-}
---------------------------------------------------------------------------
{-
Video exercises:
Exercise 1:
Consider a function 'safetail' that behaves in the same way as tail,
except that safetail maps the empty list to the empty list, whereas tail gives an error in this case. Define safetail using:
(a) a conditional expression;
(b) guarded equations;
(c) pattern matching;

Hint: the library function
null :: [a] -> Bool can be used to test if a list is empty.
-}
myl = [2, 3, 4, 5]

-- (1)(a)
safetailA :: [a] -> [a]
safetailA xs = if null xs then [] else tail xs

-- (1)(b)
safetailB :: [a] -> [a]
safetailB xs
  | null xs = []
  | otherwise = tail xs

-- (1)(c)
safetailC :: [a] -> [a]
safetailC [] = []
safetailC (_ : xs) = xs

{-Video Exercis 2:
Give three possible definitions for the logical operator (||) using pattern matching.
-}

-- (2)(1)

-- (||) :: Bool -> Bool -> Bool
-- False || False = False
-- False || True = True
-- True || False = True
-- True || True = True

-- (2)(2)

-- (||) :: Bool -> Bool -> Bool
-- False || False = False
-- _ || _ = True

-- (2)(3)

(||) :: Bool -> Bool -> Bool
False || b = b
True || _ = True

{-Video Exercise 3:

Redefine the following version of (&&) using conditionals rather than patterns:
True && True = True
_ && _ = False
-}

-- (&&) :: Bool -> Bool -> Bool
-- (&&) b1 b2 =
--   if b1 == True
--     then
--       if b2 == True
--         then True
--         else False
--     else False

{- Video Exercise 4:
Do the same for the following version:
True && b = b
False && _ = False
-}
(&&) :: Bool -> Bool -> Bool
(&&) b1 b2 = if b1 == True then b2 else False

-- Chapter 5 - List Comprehension
{-In Haskell, list comprehension can be used to construct new LISTS!! from old lists.
For example:
> [x^2 | x <- [1..5]]
> [1,4,9,16,25]

The expression x <- [1..5] is called a GENERATOR, as it states how to GENERATE values for x.

Comprehensions can have multiple generators, separated by commas:
> [(x,y) | x <- [1,2,3], y <- [4,5]]
> [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]

Later generators can depend on the variables that are introduced by earlier generators:

> [(x,y) | x <- [1..3], y <- [x..3]]
> [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

List comprehensions can also use guards to restrict the values produced by earlier generators:
> [x | x <- [1..10], even x]
> [2,4,6,8,10]

Using zip we can define a function that returns the list of all positions of a value in a list:
positions:: Eq a => a -> [a] -> [Int]
pos]itions x xs = [i | (x',i) <- zip xs [0..], x == x']

> positions 0 [1,0,0,1,0,1,1,0]
> [1,2,4,7]

String comprehensions:
Similarly, list comprehensions can be used to define functions on strings, such as counting how many timesa character occurs in a string:

count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']

> count 's' "Mississippi"
> 4
-}

factors n = [x | x <- [1 .. n], mod n x == 0]

----------------------------
{-Preparation Exercise 1
Define, using pattern matching and !without using the length! function, a function
'onlytwo' that tells us if a list has precisely two elements - in which case it must return True - or not, in which case it must return False. What is the type of onlytwo?
-}

-- onlytwo:: [a] -> Bool
-- onlytwo [] = []
-- onlytwo (x:xs) = x ++ [] ++ onlytwo(xs)

-- alldots :: Num a => [(a1, a2)] ->[(a1,a2)] -> [a]
-- alldots xs ys = [(x, y) | x <- xs, y <- ys]
-- alldots ([(a1,a2)] [(a3,a4)]) =

{-Video exercise from lecture 5; Number 1
A triple (x,y,z) of positive integers is called pythagorean if x^2 + y^2 = z^2. Using a list comprehension, define a function

pyths :: Int -> [(Int,Int,Int)]

that maps an integer n to all such triples with components in [1..n]. For example:
> pyths 5
> [(3,4,5),(4,3,5)]
-}

{-
1. Define, using pattern matching and without using the length function, a function onlytwo that tells
us if a list has precisely two elements – in which case it must return True – or not, in which case it
must return False. What is the type of onlytwo?

-}
-- onlytwo :: [a] -> Bool -- parametric polymorphic

myLength :: [a] -> Integer
myLength [] = 0
myLength (_ : xs) = 1 + myLength xs

onlytwo :: [a] -> Bool -- parametric polymorphic
onlytwo xs = myLength xs == 2

{-
2. The dot product of two pairs of numbers (a, b) and (c, d) is the number a · c + b · d. Define, using
list comprehension, a function alldots that takes two lists of pairs of numbers and returns all the
possible dot products of every pair from the first list and every pair from the second list. Find two
good test case for testing your function definition and use them to test your code. What is the type
of alldots ?
-}

-- alldots :: Num a => [(a,a)] -> [(a,a)] -> [(a,a)]
-- alldots xs ys = [zip [x] [y] | x <- map (\x -> fst x) xs, y <- map (\x -> )  ]
