module Day05 where

solutionPartOne :: String -> String
solutionPartOne raw =
    show [
        (readCreate $ take 3 raw),
        (readCreate $ take 3 $ drop 4 raw),
        (readCreate $ take 3 $ drop 7 raw)
    ]

readCreate :: String -> Maybe Char
readCreate "   " = Nothing
readCreate rawCreate = Just $ rawCreate !! 1


