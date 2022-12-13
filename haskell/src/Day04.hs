module Day04 where

solutionPartOne :: String -> String
solutionPartOne rawPair = 
    let (first, second) = splitPair rawPair
    in "[" ++ first ++ "," ++ second ++ "]"

splitPair :: String -> (String, String)
splitPair = fmap (tail) . break (==',')

solutionPartTwo :: String -> String
solutionPartTwo _ = "TODO"