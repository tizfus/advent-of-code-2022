module Day05 where

solutionPartOne :: String -> String
solutionPartOne =
    show
    . readStacks []

readStacks :: [[Maybe String]] -> String -> [[Maybe String]]
readStacks stacks "" = stacks
readStacks stacks raw =
    let (row, remainder) = span (/='\n') raw
        creates = readCreates row
    in readStacks (addCreates stacks creates) (drop 1 remainder)

addCreates :: [[Maybe String]] -> [[Maybe String]] -> [[Maybe String]]
addCreates [] creates = creates
addCreates stacks creates = 
    mapIndexed (\index stack -> stack ++ creates !! index) stacks


mapIndexed :: (Int -> a -> b) -> [a] -> [b]
mapIndexed map = mapIndexed' map 0
    where
        mapIndexed' :: (Int -> a -> b) -> Int -> [a] -> [b]
        mapIndexed' _ _ [] = []
        mapIndexed' map index list =
            map index (list !! 0) : (mapIndexed' map (index + 1) (tail list) )

     

readCreates :: String -> [[Maybe String]]
readCreates "" = []
readCreates raw = 
    [readCreate $ take 4 raw] : (readCreates $ drop 4 raw)

readCreate :: String -> Maybe String
readCreate rawCreate
    | all (==' ') rawCreate = Nothing
    | otherwise = Just [rawCreate !! 1]


