module Day02 (solutionPartOne, solutionPartTwo) where


solutionPartOne :: String -> String
solutionPartOne = readAlias

readAlias :: String -> String
readAlias "A" = "Rock"
readAlias "X" = "Rock"
readAlias "B" = "Paper"
readAlias "Y" = "Paper"
readAlias "C" = "Scissors"
readAlias "Z" = "Scissors"

solutionPartTwo :: String -> String
solutionPartTwo = undefined