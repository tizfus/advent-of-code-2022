module Day06 where


solutionPartOne :: String -> String
solutionPartOne = 
    show . (chunks 4 0)

solutionPartTwo :: String -> String
solutionPartTwo = 
    show . (chunks 14 0)

chunks :: Int -> Int -> String -> Int
chunks length index buffer =
    let chunk = take length buffer
    in case areCharsUnique chunk of
        True -> index + length
        False -> chunks length (index + 1) (tail buffer)

areCharsUnique :: String -> Bool
areCharsUnique "" = False
areCharsUnique [char] = True
areCharsUnique (char:remainder) = 
    (not $ any (==char) remainder) && areCharsUnique remainder