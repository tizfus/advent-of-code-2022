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
solutionPartOne = run CrateMover9000

solutionPartTwo :: String -> String
solutionPartTwo = run CrateMover9001

run :: Engine -> String -> String
run engine input = 
    let (rawStacks, rawMovements) = readInput input
    in 
        prettify $ moveAll
            engine
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
    let [count, stackFrom, stackTo] = 
            map read 
            $ filter (all Char.isDigit) 
            $ words raw
    in Move count (stackFrom - 1) (stackTo - 1)


moveAll :: Engine -> [Move] -> Stacks -> Stacks
moveAll _ [] stacks = stacks
moveAll engine (movement:movements) stacks = 
    moveAll engine movements $ move engine movement stacks

move :: Engine -> Move -> Stacks -> Stacks
move engine (Move count stackFromIndex stackToIndex) stacks =
    let 
        (creates, updatedStackFrom) = remove count (stacks !! stackFromIndex)
        updatedStackTo = addCreate engine creates (stacks !! stackToIndex)
    in  
        replace stackToIndex updatedStackTo
        $ replace stackFromIndex updatedStackFrom
        $ stacks

remove :: Int -> [a] -> ([a], [a])
remove = splitAt

replace :: Int -> a -> [a] -> [a]
replace _ _ [] = []
replace 0 newValue (value:list) = newValue : list
replace index newValue (value:list) = value : (replace (index -1) newValue list)
    

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