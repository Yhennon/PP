l1 = [1, 4, 5, 6]

-- Ddefine a function allbutsecond that
-- will, when given a list list , return the list consists of all but the second element of the list.

-- allbutsecond :: [a] -> [a]
allbutsecond [] = 0
allbutsecond [x] = [x]
allbutsecond (x:xs) = [x] ++ (tail xs)
allbutsecond' (x:y:xs) = x:xs
--


midtover ns = (a,b)
    where
        a = take (length ns `div` 2) ns
        b = drop (length ns `div` 2) ns

-- mod : maradékos osztás eredméynye
bingo (x, y) = x `mod` z
    where
        z = y + 42