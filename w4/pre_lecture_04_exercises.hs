la = [(1, 2), (3, 4)]

lb = [(5, 6), (7, 8)]

lc = [[1, 2], [3, 4]]

ld = [[5, 6], [7, 8]]

onlytwo :: [a] -> Bool
onlytwo [_, _] = True
onlytwo _ = False

alldots :: Num a => [(a, a)] -> [(a, a)] -> [a]
alldots a b = [(fst x * fst y) + (snd x * snd y) | x <- a, y <- b]

alldots' :: Num a => ([(a, a)], [(a, a)]) -> [a]
alldots' (first, last) = [a * c + b * d | (a, b) <- first, (c, d) <- last]

-- at every iteratin, a tuple is taken from the 'first', and a tuple from the 'last'
--