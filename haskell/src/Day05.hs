module Day05 where

import qualified Data.Char as Char
import qualified Data.Maybe as Maybe

type Create = String
type Stack = [Create]
type Stacks = [Stack]

data Move = 
    Move9000 Int Int Int
    | Move9001 Int Int Int

solutionPartOne :: String -> String
solutionPartOne input = 
    let (rawStacks, rawMovements) = readInput input
    in 
        prettify $ moveAll
            (readMovements Move9000 rawMovements)
            (readStacks rawStacks)

solutionPartTwo :: String -> String
solutionPartTwo input = 
    let (rawStacks, rawMovements) = readInput input
    in 
        prettify $ moveAll
            (readMovements Move9001 rawMovements)
            (readStacks rawStacks)

prettify :: Stacks -> String
prettify =
    concat 
    . map head
    . filter (not . null)

readInput :: String -> ([String], [String])
readInput = 
    fmap (drop 1) 
    . break null 
    . lines 

readMovements :: (Int -> Int -> Int -> Move) -> [String] -> [Move]
readMovements _ [] = []
readMovements builder (movement:movements) = 
    let [count, stackFrom, stackTo] = 
            map read 
            $ filter (all Char.isDigit) 
            $ words movement
    in builder count (stackFrom - 1) (stackTo - 1)
        : readMovements builder movements

moveAll :: [Move] -> Stacks -> Stacks
moveAll [] stacks = stacks
moveAll (movement:movements) stacks = 
    moveAll movements $ move movement stacks

move :: Move -> Stacks -> Stacks
move (Move9001 count stackFrom stackTo) stacks =
    let creates = take count (stacks !! stackFrom)
    in mapIndexed (\index stack ->
            if index == stackFrom
                then drop count stack
                else if index == stackTo
                    then creates ++ stack
                    else stack
        ) stacks
move (Move9000 count stackFrom stackTo) stacks =
    let creates = take count (stacks !! stackFrom)
    in mapIndexed (\index stack ->
            if index == stackFrom
                then drop count stack
                else if index == stackTo
                    then (reverse creates) ++ stack
                    else stack
        ) stacks

readStacks :: [String] -> Stacks
readStacks =  readStacks' 0 . init
    where
        readStacks' :: Int -> [String] -> Stacks
        readStacks' index raw =
            case readStack index raw of
                Nothing -> []
                Just stack -> stack : (readStacks' (index + 1) raw)

readStack :: Int -> [String] -> Maybe Stack
readStack index raw =
    case map (drop (index * 4)) raw of
        ("":_) -> Nothing
        rawCreates -> Just $ Maybe.catMaybes $ map readCreate rawCreates

readCreate :: String -> Maybe Create
readCreate value = 
    case value !! 1 of
        ' '-> Nothing
        create -> Just [create]

mapIndexed :: (Int -> a -> b) -> [a] -> [b]
mapIndexed mapper = map (uncurry mapper) . zip [0..]