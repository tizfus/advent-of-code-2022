module Day01 where

solution :: String -> String
solution = show . maximum . map sumCalories . group . lines

sumCalories :: [String] -> Int
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
