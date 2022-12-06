import qualified Day01
import System.IO 

main :: IO ()
main = do
    putStrLn "################### solutions..."
    day01

day01 :: IO ()
day01 = do
  input <- readFile "./app/input/day01"
  putStrLn $ "Day 01: "
  putStrLn $ "    Part One: " ++ Day01.solutionPartOne input
  putStrLn $ "    Part Two: " ++ Day01.solutionPartTwo input
  