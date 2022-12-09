module Day02 (solutionPartOne, solutionPartTwo) where


solutionPartOne :: String -> String
solutionPartOne round = 
    let [elfChoise, myChoise] = words round
    in show $ score elfChoise myChoise

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

solutionPartTwo :: String -> String
solutionPartTwo = undefined