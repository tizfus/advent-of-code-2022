module Day01 (solutionPartOne, solutionPartTwo) where

import Data.List (sort)

solutionPartOne :: String -> String
solutionPartOne = 
    show. 
    maximum. 
    splitElvesCalories

solutionPartTwo :: String -> String
solutionPartTwo = 
    show. 
    sumTopThree.
    splitElvesCalories

sumTopThree :: [Int] -> Int
sumTopThree = sum . take 3 . reverse . sort

sumStrings :: [String] -> Int
sumStrings = sum . map read

splitElvesCalories :: String -> [Int]
splitElvesCalories rawCalories =
    buildElvesCalories $ lines rawCalories
    where
        buildElvesCalories :: [String] -> [Int]
        buildElvesCalories [] = []
        buildElvesCalories calories = 
            let (elveCalories, othersCalories) = break (== "") calories
            in sumStrings elveCalories : buildElvesCalories (drop 1 othersCalories)