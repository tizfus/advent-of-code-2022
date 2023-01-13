module Day05 where

import qualified Data.Char as Char
import qualified Data.Maybe as Maybe

type Create = String
type Stack = [Create]
type Stacks = [Stack]

data Move = Move Int Int Int
data Engine =
    CrateMover9000 
    | CrateMover9001

solutionPartOne :: String -> String
solutionPartOne input = 
    let (rawStacks, rawMovements) = readInput input
    in 
        prettify $ moveAll
            CrateMover9000
            (readMovements rawMovements)
            (readStacks rawStacks)

solutionPartTwo :: String -> String
solutionPartTwo input = 
    let (rawStacks, rawMovements) = readInput input
    in 
        prettify $ moveAll
            CrateMover9001
            (readMovements rawMovements)
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

readMovements :: [String] -> [Move]
readMovements = map readMovement

readMovement :: String -> Move
readMovement raw =
    let [count, stackFrom, stackTo] = map read $ filter (all Char.isDigit) $ words raw
    in Move count (stackFrom - 1) (stackTo - 1)


moveAll :: Engine -> [Move] -> Stacks -> Stacks
moveAll _ [] stacks = stacks
moveAll engine (movement:movements) stacks = 
    moveAll engine movements $ move engine movement stacks

move :: Engine -> Move -> Stacks -> Stacks
move engine (Move count stackFrom stackTo) stacks =
    let creates = take count (stacks !! stackFrom)
    in  mapIndexed (\index stack ->
            if index == stackFrom
                then drop count stack
                else if index == stackTo
                    then addCreate engine creates stack
                    else stack
        ) stacks

addCreate :: Engine -> [Create] -> Stack -> Stack
addCreate CrateMover9000 crates = (++) $ reverse crates 
addCreate CrateMover9001 crates = (crates ++)

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