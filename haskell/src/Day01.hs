module Day01 where

solution :: String -> String
solution = show . sum . map read . words

