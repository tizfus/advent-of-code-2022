import qualified Day01
import qualified Day02
import System.IO 

main :: IO ()
main = do
    putStrLn "################### solutions..."
    day01
    day02

day01 :: IO ()
day01 = do
  input <- readFile "./app/input/day01"
  putStrLn $ "Day 01: "
  putStrLn $ "    Part One: " ++ Day01.solutionPartOne input
  putStrLn $ "    Part Two: " ++ Day01.solutionPartTwo input

day02 :: IO ()
day02 = do
  input <- readFile "./app/input/day02"
  putStrLn $ "Day 02: "
  putStrLn $ "    Part One: " ++ Day02.solutionPartOne input
  -- putStrLn $ "    Part Two: " ++ Day01.solutionPartTwo input
  