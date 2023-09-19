{-
---- Basic types ----

Bool - logical values; True/False
Char - single characterers; 'a' 
String - string of characters; "I am a string!"
Int - integer numbers; 167
Float - floating-point numberes; 5.0

---- List types ----

list - A list is a sequence of values of the SAME type;
[False,True,False] :: [Bool]
['a','b','c','d'] :: [Char]
[['a'],['b','c']] :: [[Char]]

---- Tuple types ----

tuple - A tuple is a sequence of values of DIFFERENT types:
(False,True) :: (Bool,Bool)
(False,'a',True) :: (Bool,Char,Bool)
('a',(False,'b')) :: (Char,(Bool,Char)) - Nested tuple!
(True,['a','b']) :: (Bool,[Char])

As you can see, the type of tuple encodes its size.

---- Function types ----

function - A function is  amapping from values of one type
to values of another type:

not :: Bool -> Bool
even :: Int -> Bool

In general:
t1 -> t2 is the type of functions that map values of
type t1 to values to type t2

Note:
The argument and result types are unrestricted.ApplicativeFor example, functions with multiple
arguments or results are possible using lists or tuples:

zeroto :: Int -> [Int]
zeroto n = [0..n]

add :: (Int,Int) -> Int
add (x,y) = x+y

Functions with multiple arguments are also possible
by returning FUNCTIONS AS RESULTS:

add' :: Int -> (Int -> Int)
add' x y = x + y

add' takes an integer x and returns a
function add' x. In turn, this function takes an
integer y and returns the result x + y.

Notice the difference in giving the arguments in 
the add and add' functions. add takes the arguments in a
pair of ints, while add' takes two ints, one at a time, as argument.

--
mult :: Int -> (Int -> (Int -> Int))
mult x y z = x * y * z

mult takes an integer x and returns a function 'mult x', which in turn
takes an 'integer y' and returns a function 'mult x y', which finally
takes an integer z and returns the result x*y*z

--
Function application associates to the left.
'mult x y z' means '((mult x) y) z'.

The arrow -> associates to the right.
'Int -> Int -> Int -> Int' means 'Int -> (Int -> (Int -> Int))


---- Polymorphic Functions ----
A function is called POLYMORPHIC ("of many forms") if its
type contains one or more type variables.

length :: [a] -> Int

For any type a, length takes a list of values of type a and
returns an integer.

---- Overloaded Functions ----
A polymorphic function is called OVERLOADED if its type
contains one or more class constraints.

(+) :: Num a => a -> a -> a

For any numeric type a, (+) takes two values of type a, 
and returns a value of type a.

Haskell has a number of type classes, including:
Num - Numeric types
Eq - Equality types
Ord - Ordered types

For example:
(+) :: Num a => a -> a -> a

(==) :: Eq a => a -> a -> Bool

(<) :: Ord a => a -> a -> Bool
-}

add :: (Int,Int) -> Int
add (x,y) = x + y

add' :: Int -> (Int -> Int)
add' x y = x + y

-- zeroto :: Int -> [Int]
zeroto n = [0..n]

mult :: Int -> (Int -> (Int -> Int))
mult x y z = x * y * z


-- Exercise 1 - What are the types of the following values?

-- ['a','b','c'] -- :: [Char]

-- ('a','b','c') -- :: (Char,Char,Char)

-- [(False,'0'),(True,'1')] -- :: [(Bool,Char)]

-- ([False,True],['0','1']) -- :: ([Bool],[Char])

-- [tail,init,reverse] -- :: [[a] -> [a]]

-- Exercise 2 - What are the types of the following functions?

second xs = head (tail xs) -- second :: [a] -> a 
-- For explanation, go to https://youtu.be/uBEPFkuPrcU?si=TAHWTThaM0Gy2U-s 42:00

swap (x,y) = (y,x) -- swap :: (a,b) -> (b,a)

pair x y = (x,y) -- pair :: a -> b -> (a,b)

doulbe x = x*2

palindrome xs = reverse xs == xs

twice f x = f (f x)
