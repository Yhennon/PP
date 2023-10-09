-- wrapup

wrapup :: Eq a => [a] -> [[a]] -- ad-hoc polymorph
wrapup [] = []
wrapup [x] = [[x]]
wrapup (x:xs) = 