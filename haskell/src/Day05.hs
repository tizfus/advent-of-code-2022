module Day05 where

solutionPartOne :: String -> String
solutionPartOne =
    show
    . readStacks []

readStacks :: [[String]] -> String -> [[String]]
readStacks stacks "" = stacks
readStacks stacks raw =
    let (row, remainder) = span (/='\n') raw
        creates = readCreates row
    in readStacks (addCreates stacks creates) (drop 1 remainder)

addCreates :: [[String]] -> [[String]] -> [[String]]
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

     

readCreates :: String -> [[String]]
readCreates "" = []
readCreates raw = 
    case readCreate $ take 4 raw of
        Nothing -> [] : (readCreates $ drop 4 raw)
        Just create -> [create] : (readCreates $ drop 4 raw)

readCreate :: String -> Maybe String
readCreate rawCreate
    | all (==' ') rawCreate = Nothing
    | otherwise = Just [rawCreate !! 1]


