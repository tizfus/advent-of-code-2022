module Day05 where

solutionPartOne :: String -> String
solutionPartOne input = 
    let (rawStacks, movements) = readInput input
    in show $ readStacks rawStacks

readInput :: String -> ([String], [String])
readInput = 
    fmap tail 
    . break isEmpty 
    . lines 

readStacks :: [String] -> [[String]]
readStacks =  readStack 0 . init

readStack :: Int -> [String] -> [[String]]
readStack index raw =
    if hasEmptyValue values
        then []
        else (readCreate values) : (readStack (index + 1) raw)
    where
        hasEmptyValue = any isEmpty
        values = map takeValues raw
        takeValues = take 4 . drop (index * 4)

isEmpty :: String -> Bool
isEmpty "" = True
isEmpty _ = False

readCreate :: [String] -> [String]
readCreate = 
    map (\value -> [value !! 1]) 
    . filter (any (/=' '))