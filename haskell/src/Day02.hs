module Day02 (solutionPartOne, solutionPartTwo) where


solutionPartOne :: String -> String
solutionPartOne = 
    show
    . sum
    . map (\[elfChoise, myChoise] -> score elfChoise myChoise)
    . map words
    . lines

score :: String -> String -> Int
score elfChoise myChoise = 
    scoreChoise myChoise
    + scoreRound elfChoise myChoise

scoreChoise :: String -> Int
scoreChoise "X" = 1
scoreChoise "Y" = 2
scoreChoise "Z" = 3

scoreRound :: String -> String -> Int
scoreRound "A" "X" = 3
scoreRound "B" "Y" = 3
scoreRound "C" "Z" = 3

scoreRound "A" "Y" = 6
scoreRound "B" "Z" = 6
scoreRound "C" "X" = 6

scoreRound "A" "Z" = 0
scoreRound "B" "X" = 0
scoreRound "C" "Y" = 0

solutionPartTwo :: String -> String
solutionPartTwo = undefined