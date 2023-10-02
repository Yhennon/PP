{-Recursion on Lists
Recurison is not restricted to numbers,but can also be used to  define functions on lists.
product:: Num a => [a] -> a
product [] = 1
product (n:ns) = n * product ns

length:: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs

reverse:: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

zip:: [a] -> [b] -> [(a,b)]
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x,y): zip xs ys

qsort:: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
               where
                 smaller = [a | a <- xs, a <= x]
                 larger = [b | b <- xs, b > x]

-}

-- -- replicate 3 5 -> [5,5,5]

replicate' n x = [x | _ <- [1 .. n]] -- iterate n times, dont give back anything, so you will just get x n times

-- Very important to have the "base case" !! unless a recurison wouldnt stop or would crash
rep 0 x = []
rep n x = [x] ++ rep (n - 1) x

-- or
rep' 0 x = []
rep' n x = x : rep (n - 1) x

lx = [1, 2, 3, 4, 5, 6, 7, 8,9 ]

-- improve [1,2,3,4,5,6,7] -> [1,3,5,7]
improve [] = []
-- improve [_] = []
-- improve [_, _] = [_]
improve (x : xs) = [x] ++ improve (tail xs) -- take the first, then remove the first from the remainder list, repeat until end

imp [] = []
imp [x] = [x]
imp (x : _ : xs) = [x] ++ imp (xs)

-- menj fejben végig rajta