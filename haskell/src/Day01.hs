module Day01 (solution, solutionPartOne, solutionPartTwo) where

import Data.List (sort)

solutionPartOne :: String -> String
solutionPartOne = 
    show. 
    maximum. 
    toElveCalories.
    lines

solutionPartTwo :: String -> String
solutionPartTwo = 
    show. 
    sumTopThree.
    toElveCalories. 
    lines

solution :: String -> String
solution = solutionPartTwo

sumTopThree :: [Int] -> Int
sumTopThree = sum . take 3 . reverse . sort

sumStrings :: [String] -> Int
sumStrings = sum . map read

toElveCalories :: [String] -> [Int]
toElveCalories [] = []
toElveCalories calories =
    let (elveCalories, remainder) = break (== "") calories
    in sumStrings elveCalories : toElveCalories (tailSafe remainder)

tailSafe :: [a] -> [a]
tailSafe [] = []
tailSafe list = tail list
