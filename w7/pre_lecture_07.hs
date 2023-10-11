{- Type Declaration
A NEW name for an EXISTING type can be defined using 'type declaratioN'

for example:

type String = [Char]

string is a synonim for the type [Char]
-}
-- Notice how you
-- DECLARE a TYPE ,
-- and DEFINE a function. Not the same!

{-
Type declaration can be used  to make other types easier to read. For example, given

type Pos = (Int,Int)

we can define:

origin :: Pos
origin = (0,0)

goLeft :: Pos -> Pos
goLeft (x,y) = (x-1,y)

--------

Like function definitions, type declarations can have parameters. For example:

type Pair a = (a,a)

we can define:

mult :: Pair Int -> Int
mult (m,n) = m*n

copy :: a -> Pair a
copy x = (x,x)

---------

Type declarations can be nested:

type Pos = (Int,Int)
type Trans = Pos -> Pos

But cannot be recursive:

type Tree = (Int,[Tree]) --  X ILLEGAL X
-}

{- Data Declaration, the second way to  declare new types.

A completely new type can be defined by SPECIFYING ITS VALUES using a data declaration.

data Bool = False | True

Bool is s new type, with two new values False and True

The two values are called the CONSTRUCTORS for the type.

Type and Constructor names must always start with a capital letter.

Data declarations are similar to context free grammars. The former specifies the values of a type, the latter specifies the strings of a language.

--------
Values of new types can be used in the same ways as values of built-in types.

data Answer = Yes | No | Unknown

we can define:

answers :: [Answer]
answers = [Yes,No,Unknown] -- You can use the constructors as values

flip :: Answer -> Answer
flip Yes = No
flip No = Yes
flip Unknown = Unknown

The flip function showcases 3 things.
You can take a new type as an input
You can give a new type as an output
You can use pattern matching on new types.

--------

The constructors of a type can also have parameters:
data Shape = Circle Float | Rect Float Float

we can define:
square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y

notice how u need to write the Name of the constructor in order to use it.
-}
