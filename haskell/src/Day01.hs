module Day01 where

solution :: String -> String
solution = show . last . map sumCalories . group . lines

sumCalories :: (Read a, Num a) => [String] -> a
sumCalories [] = 0
sumCalories calories = sum . map read $ calories

group :: [String] -> [[String]]
group [] = []
group calories =
    let (elveCalories, remainder) = break (== "") calories
    in elveCalories : group (tailSafe remainder)

tailSafe :: [a] -> [a]
tailSafe [] = []
tailSafe list = tail list
