qsort[] = []
qsort(x:xs) = qsort ys ++ [x] ++ qsort zs
            where
                ys = [a | a <- xs, a <= x]
                zs = [b | b <- xs, b > x]
-- If you check the type of the qsort function, you will see that it is "qsort :: Ord a => [a] -> [a]"
-- This means, that the qsort function can be used with any type, provided that Ordering is applicable for that (a) type. It takesin a list as argument, and returns a list .
-- So, this could be a list of integers, or a string, or a list of boolean values for example.

-- try out in ghci:
-- qsort [3,1,4,2]
-- qsort (reverse [1..10])
-- qsort "haskell"
-- qsort [True,False,True,False]
