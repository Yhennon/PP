{- Higher Order Functions
A Function is called higher-order if it takes a function as an argument or returns a function as a result

twice :: (a->a) -> a -> a
twice f x = f (f x)

Twice is higher order because it takes a function as its first argument

twice (+1) 3
> 5
(because) it translates to 1 + (1 + 3)

---
Why are Higher Order Functions Useful?

Common programming idioms can be encoded as functions within the language itself.

Domain specific languages can be defined as collections of higher-order functions.

Algebraic properties of higher-order functions can be used to reason about programs.
---

The higher-order library function called 'map' applies a function to every element of a list.
map :: (a -> b) -> [a] -> [b] || Means that it takes a function from a to b ...

> map (+1) [1,3,5,7]
> [2,4,6,8]

---
filter :: (a -> Bool) -> [a] -> [a]
> filter even [1..10]
> [2,4,6,8,10]
---
foldr function ( fold right )

f [] = v
f (x:xs) = x (anyinfixoperator) f xs

f maps the empty list to some value v, and any non-empty list to some function (anyinfixoperator) applied to its head and f of its tail.
Blah blah. What it does is, takes the first element, then the  next one, and performs the infix operation,
then the product of this operation becomes the next element it will do the operation with.. Then when the list is empty at the end, it does the operation with the v element too.
easy. example below

f [] = 0
f (x : xs) = x + f xs

-- > f [1,2,3,4,5]
-- > 15

This is for example how "sum" works.

sum [] = 0
sum (x:xs) = x + sum xs
Here v is 0, and the infix operator is + .

Or this is how 'product' works.
product [] = 1
product (x:xs) = x * product xs
Here v is 1, and the infix operator is *
0

----
The library function '(.)' returns the composition of two functions as a single function.
f . g = \x -> f (g x)

for example:

odd :: Int -> Bool
odd = not . even

----

all :: (a -> Bool) -> [a] -> Bool
all p xs = and [p x | x <- xs]

For example:
> all even [2,4,6,8,10]
> True

-----
> any (== ' ') "abc def"
> True

----

> takeWhile (/= ' ') "abc def" || This means, that "take the next character from the string while it does not equal to a space character"
> "abc"

Can be very useful for parsing, splitting strings and stuff

----
Dually, the function 'dropWhile' removes elements while a predicate holds of all the elements.

> dropWhile (== ' ') "   abc"
\|| While the next character in the string equals to a space, drop it.
> "abc"
-}
-- Something extra i learned today: the fromEnum prelude function. Gives the ordinal value of a character.
-- > fromEnum 'a'
-- > 97

-- ################################################# --
{- Exercises

Use higher order functions !!

map - applying a function to every element of a list

filter - which selects every element from a list that satisfies a predicate ("gives you a way of throwing things away")

foldr functions  - like how sum,product works, or 'f' below.

foldl functions - same as foldr, but to the left instead of right ( fold right, fold left)

(.) - returns the composition of two functions - not a funciton,just operator | the right-hand side function is applied first

all - decides if every element of a list satisfies a given predicate

any - decides if AT LEAST one element of a list satisfies a predicate.

takeWhile - selects elements from a list while a predicate holds of all the element

dropWhile - this function removes elements while a predicate holds of all the elements.
-}

-- abba -> [1,2,2,1]
-- positions

-- Actually, rewrite this with '(.)' higher-order function (chain the fromEnum and a lambda function?)
-- positions xs = [fromEnum x - 96 | x <- xs]

-- positions xs = [x - 96 | x <- convert xs]
--   where
--     convert = map fromEnum

positions xs = [x - 96 | x <- map fromEnum xs]

-- positions' = map (\c -> fromEnum c - 96)

-- other solution:
{- Exercise 2

sumsq - takes an integer 'n' as its argument and returns the sum of the squares of the firs n integers. so,
>sumsq 4s
> 30

> sumsq9
> 285

USE FOLDR TO DEFINE SUMSQ! DO NOT USE MAP.
Reminder about foldr:
f [] = v
f (x:xs) = x (anyinfixoperator) f xs

f [] = 0
f (x : xs) = x + f xs
-}

-- sumsq n = sum [x ^ 2 | x <- [1 .. n]]

-- Using foldr.. very quickly, this works, but im not giving 'n' as an input right now. fix that. I AM NOT SURE THE EXERCISE IS GIVEN CORRECTLY, CUZ WITH FOLDER I MUST HAVE 'X:XS' , BUT THE EXERCISE SAYS THE INPUT SHOULD BE A SINGLE 'N'
sumsq' [] = 0
sumsq' (x : xs) = x ^ 2 + sumsq' xs

-- sumsq'' xs = foldr + 0 x
--     where x <- xs

sumsq n = foldr (+) 0 [x ^ 2 | x <- [1 .. n]]
