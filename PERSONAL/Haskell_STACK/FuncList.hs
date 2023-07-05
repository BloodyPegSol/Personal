module FuncList where

head1 :: [a] -> a            -- returns the first element
head1 (x:xs) = x

tail1 :: [a] -> [a]          -- returns everything except the first element
tail1 (x:xs) = xs

last1 :: [a] -> a	     -- returns the last element
last1 [x] = x
last1 (_:xs) = last1 xs

init1 :: [a] -> [a]          -- returns everything except the last element
init1 [x] = []
init1 (x:xs) = x:init1 xs 
 
take1 :: Int -> [a] -> [a]   -- returns the n first elements
take1 0 _ = []
take1 n (x:xs) = x:take1 (n-1) xs

--drop :: Int -> [a] -> [a]   -- returns everything except the n first elements
--(++) :: [a] -> [a] -> [a]   -- lists are catenated with the ++ operator
--(!!) :: [a] -> Int -> a     -- lists are indexed with the !! operator
--reverse :: [a] -> [a]       -- reverse a list
--null :: [a] -> Bool         -- is this list empty?
--length :: [a] -> Int        -- the length of a list
