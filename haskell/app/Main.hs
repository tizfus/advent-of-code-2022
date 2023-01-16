import qualified Day01
import qualified Day02
import qualified Day03
import qualified Day04
import qualified Day05
import qualified Day06

import Control.Monad (forM_)

type Solution = (String -> String)
data Day = Day {
  numberDay :: String,
  solutionPartOne :: Solution,
  solutionPartTwo :: Solution
}




main :: IO ()
main = do
    [
        Day "01" Day01.solutionPartOne Day01.solutionPartTwo,
        Day "02" Day02.solutionPartOne Day02.solutionPartTwo,
        Day "03" Day03.solutionPartOne Day03.solutionPartTwo,
        Day "04" Day04.solutionPartOne Day04.solutionPartTwo,
        Day "05" Day05.solutionPartOne Day05.solutionPartTwo,
        Day "06" Day06.solutionPartOne Day06.solutionPartTwo
        ] `forM_` printSolutions

printSolutions :: Day -> IO ()
printSolutions (Day numberDay solutionPartOne solutionPartTwo) = do
    input <- readFile ("./app/input/day" ++ numberDay )
    putStrLn $ ("Day " ++ numberDay ++ ":")
    putStrLn $ "    Part One: " ++ solutionPartOne input
    putStrLn $ "    Part Two: " ++ solutionPartTwo input