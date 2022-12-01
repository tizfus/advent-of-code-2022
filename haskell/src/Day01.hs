module Day01 where

import Data.List (sort)

solutionPartOne :: String -> String
solutionPartOne = show . maximum . map sumCalories . group . lines

solutionPartTwo :: String -> String
solutionPartTwo = show . sum . take 3 . reverse . sort . map sumCalories . group . lines

solution :: String -> String
solution = solutionPartTwo

sumCalories :: [String] -> Int
sumCalories [] = 0
sumCalories calories = sum . map read $ calories

group :: [String] -> [[String]]
group [] = []
group calories =
    let (elveCalories, remainder) = break (== "") calories
    in elveCalories : group (tailSafe remainder)

tailSafe :: [a] -> [a]
tailSafe [] = []
tailSafe list = tail list
