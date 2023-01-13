module Day05 where

import qualified Data.Char as Char
import qualified Data.Maybe as Maybe

type Create = String
type Stack = [Create]
type Stacks = [Stack]

data Move = Move {
    count :: Int,
    stackFrom :: Int,
    stackTo :: Int
}

solutionPartOne :: String -> String
solutionPartOne input = 
    let (rawStacks, rawMovements) = readInput input
    in 
        prettify $ moveAll
            (readMovements rawMovements)
            (readStacks rawStacks)

prettify :: Stacks -> String
prettify =
    concat 
    . map head
    . filter (not . isEmpty)

readInput :: String -> ([String], [String])
readInput = 
    fmap (drop 1) 
    . break isEmpty 
    . lines 

readMovements :: [String] -> [Move]
readMovements = map readMovement 

moveAll :: [Move] -> Stacks -> Stacks
moveAll [] stacks = stacks
moveAll (movement:movements) stacks = 
    moveAll movements $ move movement stacks

move :: Move -> Stacks -> Stacks
move (Move count stackFrom stackTo) stacks =
    let creates = take count (stacks !! stackFrom)
    in mapIndexed (\index stack ->
            if index == stackFrom
                then drop count stack
                else if index == stackTo
                    then addCreate creates stack
                    else stack
        ) stacks

addCreate :: [Create] -> Stack -> Stack
addCreate [] stack = stack
addCreate (create:creates) stack = addCreate creates $ create : stack

readMovement :: String -> Move
readMovement raw =
    let [count, stackFrom, stackTo] = map read $ filter (all Char.isDigit) $ words raw
    in Move count (stackFrom - 1) (stackTo - 1)

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

isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

readCreate :: String -> Maybe Create
readCreate value = 
    case value !! 1 of
        ' '-> Nothing
        create -> Just [create]

mapIndexed :: (Int -> a -> b) -> [a] -> [b]
mapIndexed mapper = map (uncurry mapper) . zip [0..]