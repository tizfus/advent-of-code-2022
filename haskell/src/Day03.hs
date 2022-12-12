module Day03 (solutionPartOne, solutionPartTwo) where

import Data.List (elemIndex)
import Data.Maybe (fromJust)

type RucksackItems = String
type Items = String
type Item = Char

solutionPartOne :: String -> String
solutionPartOne =
    show
    . sum
    . map calcPrioritySameItem
    . lines

solutionPartTwo :: String -> String
solutionPartTwo _ = "TODO"

calcPrioritySameItem :: RucksackItems -> Int
calcPrioritySameItem = 
    priority
    . uncurry findSameItem 
    . compartments

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