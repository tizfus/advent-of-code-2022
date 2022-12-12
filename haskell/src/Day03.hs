module Day03 (solutionPartOne, solutionPartTwo) where

type RucksackItems = String
type Items = String

solutionPartOne :: String -> String
solutionPartOne rucksack =
    uncurry findSameItem $ compartments rucksack

solutionPartTwo :: String -> String
solutionPartTwo = undefined


compartments :: RucksackItems -> (Items, Items)
compartments rucksack = splitAt (length rucksack `div` 2) rucksack

findSameItem :: Items -> Items -> String
findSameItem firstCompartment secondCompartment =
    filter (`elem` secondCompartment) firstCompartment
