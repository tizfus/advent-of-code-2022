module Day06 where


solutionPartOne :: String -> String
solutionPartOne = 
    show
    . snd
    . head
    . filter (\(chunk,index) -> areUniqChars chunk)
    . chunks 0

chunks :: Int -> String -> [(String, Int)]
chunks index buffer
    | length buffer <= 4 = [(buffer, index + 4)]
    | otherwise = (take 4 buffer, index + 4) : (chunks (index + 1) (tail buffer))

areUniqChars :: String -> Bool
areUniqChars "" = False
areUniqChars [char] = True
areUniqChars (char:remainder) = 
    (not $ any (==char) remainder) && areUniqChars remainder