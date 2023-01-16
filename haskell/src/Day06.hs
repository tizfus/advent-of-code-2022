module Day06 where


solutionPartOne :: String -> String
solutionPartOne = show . chunks

chunks :: String -> [String]
chunks buffer
    | length buffer <= 4 = [buffer]
    | otherwise = take 4 buffer : chunks (tail buffer)