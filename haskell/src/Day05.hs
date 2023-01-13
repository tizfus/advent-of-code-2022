module Day05 where

import qualified Data.Char as Char
import qualified Data.Maybe as Maybe

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
readStacks =  readStacks' 0 . init
    where
        readStacks' :: Int -> [String] -> Stacks
        readStacks' index raw =
            case readStack' index raw of
                Nothing -> []
                Just stack -> stack : (readStacks' (index + 1) raw)

readStack' :: Int -> [String] -> Maybe Stack
readStack' index raw =
    case map (drop (index * 4)) raw of
        ("":_) -> Nothing
        rawCreates -> Just $ Maybe.catMaybes $ map readCreate rawCreates

isEmpty :: String -> Bool
isEmpty "" = True
isEmpty _ = False

readCreate :: String -> Maybe Create
readCreate value = 
    case value !! 1 of
        ' '-> Nothing
        create -> Just [create]