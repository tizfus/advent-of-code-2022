module Day05 where

import qualified Data.Char as Char

type Create = String
type Stack = [Create]
type Stacks = [Stack]

solutionPartOne :: String -> String
solutionPartOne input = 
    let (rawStacks, positionsInfo) = readInput input
    in show $ changePosition positionsInfo $ readStacks rawStacks

readInput :: String -> ([String], [String])
readInput = 
    fmap (drop 1) 
    . break isEmpty 
    . lines 

changePosition :: [String] -> Stacks -> Stacks
changePosition [] stacks = stacks
changePosition (movements:_) stacks = 
    let [count, stackFrom, stackTo] = map read $ filter (all Char.isDigit) $ words movements
        containers = take count $ stacks !! (stackFrom - 1)
    in [containers, [], [] ]

readStacks :: [String] -> Stacks
readStacks =  readStack 0 . init

readStack :: Int -> [String] -> Stacks
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

readCreate :: [String] -> Stack
readCreate = 
    map (\value -> [value !! 1]) 
    . filter (any (/=' '))