import qualified Day01
import qualified Day02
import qualified Day03
import qualified Day04

main :: IO ()
main = do
    day01
    day02
    day03
    day04

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
  putStrLn $ "    Part Two: " ++ Day02.solutionPartTwo input

day03 :: IO ()
day03 = do
  input <- readFile "./app/input/day03"
  putStrLn $ "Day 03: "
  putStrLn $ "    Part One: " ++ Day03.solutionPartOne input
  putStrLn $ "    Part Two: " ++ Day03.solutionPartTwo input

day04 :: IO ()
day04 = do
  input <- readFile "./app/input/day04"
  putStrLn $ "Day 04: "
  putStrLn $ "    Part One: " ++ Day04.solutionPartOne input
  putStrLn $ "    Part Two: " ++ Day04.solutionPartTwo input
  