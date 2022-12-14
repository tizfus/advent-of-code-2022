module Day04 where

type Sections = (Int, Int)

solutionPartOne :: String -> String
solutionPartOne = 
    show
    . sum
    . map (uncurry contains)
    . map readPair
    . lines

contains :: Sections -> Sections -> Int
contains firstSection secondSection
    | (fst firstSection) <= (fst secondSection) && (snd firstSection) >= (snd secondSection) = 1
    | (fst secondSection) <= (fst firstSection) && (snd secondSection) >= (snd firstSection) = 1
    | otherwise = 0

contains2 :: Sections -> Sections -> Int
contains2 firstSection secondSection =
    if any (`elem` [(fst firstSection)..(snd firstSection)]) [(fst secondSection)..(snd secondSection)]
    then 1
    else 0
    

readPair :: String -> (Sections, Sections)
readPair = mapTuple readSections . splitBy ','

readSections :: String -> Sections
readSections = mapTuple read . splitBy '-'

splitBy :: Char -> String -> (String, String)
splitBy char = fmap (tail) . break (== char)

mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple map (fst, snd) = (map fst, map snd)

solutionPartTwo :: String -> String
solutionPartTwo =
    show
    . sum
    . map (uncurry contains2)
    . map readPair
    . lines