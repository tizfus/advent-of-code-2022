module Day04 where

type Sections = (Int, Int)

solutionPartOne :: String -> String
solutionPartOne rawPair = 
    let (firstSection, secondSection) = readPair rawPair
    in show (contains firstSection secondSection)

contains :: Sections -> Sections -> Bool
contains firstSection secondSection =
    (fst firstSection) <= (fst secondSection)
    && (snd firstSection) >= (snd secondSection)

readPair :: String -> (Sections, Sections)
readPair = mapTuple readSections . splitBy ','

readSections :: String -> Sections
readSections = mapTuple read . splitBy '-'

splitBy :: Char -> String -> (String, String)
splitBy char = fmap (tail) . break (== char)

mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple map (fst, snd) = (map fst, map snd)

solutionPartTwo :: String -> String
solutionPartTwo _ = "TODO"