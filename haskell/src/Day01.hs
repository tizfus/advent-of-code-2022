module Day01 where

import Data.List (sort)

solutionPartOne :: String -> String
solutionPartOne = 
    show. 
    maximum. 
    elveCalories.
    lines

solutionPartTwo :: String -> String
solutionPartTwo = 
    show. 
    sumTopThree.
    elveCalories. 
    lines

solution :: String -> String
solution = solutionPartTwo

sumTopThree :: [Int] -> Int
sumTopThree = sum . take 3 . reverse . sort

sumStrings :: [String] -> Int
sumStrings = sum . map read

elveCalories :: [String] -> [Int]
elveCalories [] = []
elveCalories calories =
    let (elveCalories, remainder) = break (== "") calories
    in sumStrings elveCalories : elveCalories (tailSafe remainder)

tailSafe :: [a] -> [a]
tailSafe [] = []
tailSafe list = tail list
