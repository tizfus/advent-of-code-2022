module Day03 (solutionPartOne, solutionPartTwo) where

import Data.List (elemIndex)
import Data.Maybe (fromJust)

type Items = String
type Item = Char

solutionPartOne :: String -> String
solutionPartOne =
    show
    . sum
    . map (calcPriorityCommonItem . compartments)
    . lines

solutionPartTwo :: String -> String
solutionPartTwo =
    show
    . sum
    . map calcPriorityCommonItem
    . group
    . lines

group :: [Items] -> [[Items]]
group [] = []
group (first:second:third:reminder) = [first, second, third] : group reminder

findCommonItem :: [Items] -> Item
findCommonItem listItems = 
    let sampleList = head listItems
        reminderListItems = tail listItems
    in head $ filter (\item -> exists item `all` reminderListItems) sampleList

exists :: Item -> Items -> Bool 
exists = elem

calcPriorityCommonItem :: [Items] -> Int
calcPriorityCommonItem = priority . findCommonItem 

compartments :: Items -> [Items]
compartments rucksack = 
    let (firstCompartment, secondCompartment) = splitAt (length rucksack `div` 2) rucksack
    in [firstCompartment, secondCompartment]


priority :: Item -> Int
priority =
    (+1)
    . fromJust
    . (flip elemIndex) (['a'..'z'] ++ ['A'..'Z'])