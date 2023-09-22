-- Write down Haskell definitions of quango and tango that have the following types; it is
-- not important what the definitions do as long as they are type correct.
-- quango :: a −> [a]
-- tango :: Num p1 => ( a , b ) −> p2 −> p1
-- Are quango and tango polymorphic? If so, tell us if for each of them if this involves
-- parametric polymorphism or overloading (ad hoc polymorphism) or maybe both – and
-- how. If not, tell us why

-- quango :: a -> [a]
quango (x) = [x]

-- tango (x, y) = x * y || idk
tango (x,y) z = z
-- Both quango and tango are polymorphic(parametic), because their type's contain at least one type variable.
-- Tango is overloaded, because it's type contains a class constraint

-- (Lz.xy)8Lz.(Lu.uu)) -- Application (Lx.xy)[x -> (Lz.Lu.uu))]
-- (Lz.(Lu.uu)y)