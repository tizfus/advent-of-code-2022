module Day05 where

solutionPartOne :: String -> String
solutionPartOne raw =
    show $ readCreates raw

readCreates :: String -> [Maybe Char]
readCreates "" = []
readCreates raw = 
    (readCreate $ take 4 raw) : (readCreates $ drop 4 raw)

readCreate :: String -> Maybe Char
readCreate rawCreate
    | all (==' ') rawCreate = Nothing
    | otherwise = Just $ rawCreate !! 1


