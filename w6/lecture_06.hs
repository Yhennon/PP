-- within :: Num a => [a] -> (a, a) -> [a]

-- returns a list of numbers which are in the input list and within the range(inclusive) given by the input pari
-- within :: Ord a => [a] -> (a, a) -> [a]
within xs (n1, n2) = filter (\x -> x >= n1 && x <= n2) xs -- The lambda function gives back True or False, for every x that is True, it will be in the new list.

-- > [1,2,3,4,5] (1,2)

la = [[], [], [1, 2], [3, 4]]

-- sumrows [] = 0
-- sumrows (x : xs) = sum (x) ++ sumrows (xs)
-- sumrows :: [[Int]] -> [Int]
sumrows x = foldr ((:) . sum) [] x

---

fact k = product [1 .. k]

-- approx n = sum(foldr (\x -> ) 0 [1..n])

approx n = sum [1 / fact x | x <- [0 .. n]]

approx' n = sum (map (\k -> 1 / fact k) [0 .. n])

---
-- This function takes two lists as inputs, and inputs the first list to the end of the second list.
fingo :: [a] -> [a] -> [a]
fingo xs ys = foldr (:) xs ys

-- More explanation on this (foldr and foldl) in the book, P. 81
lb = [1, 2, 3]

lc = [4, 5]

l1 = "aha aha,"

l2 = "I like it"

----
