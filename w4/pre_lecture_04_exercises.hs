la = [(1, 2), (3, 4)]

lb = [(5, 6), (7, 8)]

lc = [[1, 2], [3, 4]]

ld = [[5, 6], [7, 8]]

dotproduct a b = [ (fst x * fst y) + (snd x * snd y) | x <- a, y <- b]

jonas_alldots (first,last) = [a*c + b*d | (a,b) <- first, (c,d) <- last]