module Day05 where

solutionPartOne :: String -> String
solutionPartOne = show . readStacks

readStacks :: String -> [[String]]
readStacks =  readStack 0 . lines

readStack :: Int -> [String] -> [[String]]
readStack index raw =
    if hasEmptyValue values
        then []
        else (readCreate values) : (readStack (index + 1) raw)
    where
        hasEmptyValue = any (""==)
        values = map takeValues raw
        takeValues = take 4 . drop (index * 4)
    

readCreate :: [String] -> [String]
readCreate = 
    map (\value -> [value !! 1]) 
    . filter (any (/=' '))