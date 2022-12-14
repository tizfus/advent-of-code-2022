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
readPair = tupleMap readSections readSections . splitBy ','

readSections :: String -> Sections
readSections = tupleMap read read . splitBy '-'

splitBy :: Char -> String -> (String, String)
splitBy char = fmap (tail) . break (== char)

tupleMap :: (a -> c) -> (b -> d) -> (a, b) -> (c, d)
tupleMap fstMap sndMap (fst, snd) = (fstMap fst, sndMap snd)

solutionPartTwo :: String -> String
solutionPartTwo _ = "TODO"