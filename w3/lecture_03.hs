{-- 
Problem 1

What is the type of the function:

twice f x  = f (f (x)) 
--}

-- twice f :: 

-- f (x) = [sum,head]
twice f x  = f (f (x))  -- polymorphic

-- twicetwo (f, x) = f (f x)

{-
Problem 2

Here is a term in the lambda-calculus:
(Lx.xx)(Lx.xx)

(Lx.xx)(Lx.xx) -> alpha conversion
(Lx.xx)(Lx'.x'.x') -> beta-reduction
(Lx'.x'x')(Lx'.x'x') -> alpha conversion -- ez a line már az xx-re behelyettesítés, tehát az x-ekből (Lx'.x'x') lett
(Lx'.x'x')(Lx.xx) -> beta-reduction
(Lx.xx)(Lx.xx) -> forever



Are the bound variables in the term distinct? If they are not, rename them such that they are.
Once you have found the answer to this, then find a reduction step that the term can take. To do
this, use the reduction rules of the note.
-}
-- They are not distinct

{-
Problem 3 
What is the type of the function:

dingo (x,y) = [x, y]

-}
--Solution:
dingo :: (a, a) -> [a]
dingo (x,y) = [x,y]

-- The type is like this, because the element type of the list has to be homogeneus, so the elements of the tuple
-- will be of the same type aswell. 
-- dingo is polymorphic, because it contains at least one type variable.

{-
Problem 4 Solve in pairs
Bighead tells us how many elements in a list xs are greater than (>) the head of xs.

> bighead [7,4,5,8,9]
> 2

Someone says the type is [Num] -> Num
Why is this not correct? What is the type of bighead
-}
--Solution:
-- It is wrong for multiple reasons, first "[Num] -> Num" is invalid syntax
-- Also the list contains all types that have an order
-- bighead :: (Ord b, Integral a) => [b] -> a


-- Saját,kalap szar, a bigheadet probaltam megírni
-- bighead (xs)  = length ([] ++ ys)
--     where ys = bighead [a | a <- xs, a <= head xs]

{-
Problem 5

Why are function types not allowed to be members of the type class Eq? hint: Many of you have seen
something called EQtm in courses you followed before.

--Solution:

-}