module Day03 (solutionPartOne, solutionPartTwo) where

import Data.List (elemIndex)
import Data.Maybe (fromJust)

type RucksackItems = String
type Items = String
type Item = Char

solutionPartOne :: String -> String
solutionPartOne =
    show
    . priority
    . uncurry findSameItem 
    . compartments

solutionPartTwo :: String -> String
solutionPartTwo = undefined


compartments :: RucksackItems -> (Items, Items)
compartments rucksack = splitAt (length rucksack `div` 2) rucksack

findSameItem :: Items -> Items -> Item
findSameItem firstCompartment secondCompartment =
    head $ filter (`elem` secondCompartment) firstCompartment

priority :: Item -> Int
priority =
    (+1)
    . fromJust
    . (flip elemIndex) (['a'..'z'] ++ ['A'..'Z'])