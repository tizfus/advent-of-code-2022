module Day06 where


solutionPartOne :: String -> String
solutionPartOne = 
    show . chunks 0

chunks :: Int -> String -> Int
chunks index buffer =
    let chunk = take 4 buffer
    in case areCharsUnique chunk of
        True -> index + 4
        False -> chunks (index + 1) (tail buffer)

areCharsUnique :: String -> Bool
areCharsUnique "" = False
areCharsUnique [char] = True
areCharsUnique (char:remainder) = 
    (not $ any (==char) remainder) && areCharsUnique remainder