module Day02 (solutionPartOne, solutionPartTwo) where

data Selection = Rock | Paper | Scissors
type Round = (Selection, Selection)

solutionPartOne :: String -> String
solutionPartOne = 
    show
    . sum
    . map (score `uncurry`)
    . readRounds

readRounds :: String -> [Round]
readRounds = map readRound . lines

readRound :: String -> Round
readRound raw =
    let [elfChoise, myChoise] = map readSelection $ words raw
    in (elfChoise, myChoise)

readSelection :: String -> Selection
readSelection "A" = Rock
readSelection "X" = Rock

readSelection "B" = Paper
readSelection "Y" = Paper

readSelection "C" = Scissors
readSelection "Z" = Scissors

score :: Selection -> Selection -> Int
score elfChoise myChoise = 
    scoreChoise myChoise
    + scoreRound elfChoise myChoise

scoreChoise :: Selection -> Int
scoreChoise Rock = 1
scoreChoise Paper = 2
scoreChoise Scissors = 3

scoreRound :: Selection -> Selection -> Int
scoreRound Rock Rock = 3
scoreRound Paper Paper = 3
scoreRound Scissors Scissors = 3

scoreRound Rock Paper = 6
scoreRound Paper Scissors = 6
scoreRound Scissors Rock = 6

scoreRound Rock Scissors = 0
scoreRound Paper Rock = 0
scoreRound Scissors Paper = 0


solutionPartTwo :: String -> String
solutionPartTwo raw =
    show
    $ sum
    $ (flip map) (lines raw) (\rawRound ->
        case words rawRound of
            [elfChoise, "X"] -> score (readSelection elfChoise) (loosingOpposite $ readSelection elfChoise)
            [elfChoise, "Y"] -> score (readSelection elfChoise) (readSelection elfChoise)
            [elfChoise, "Z"] -> score (readSelection elfChoise) (winningOpposite $ readSelection elfChoise)
    )

loosingOpposite :: Selection -> Selection
loosingOpposite Rock = Scissors
loosingOpposite Paper = Rock
loosingOpposite Scissors = Paper

winningOpposite :: Selection -> Selection
winningOpposite Rock = Paper
winningOpposite Paper = Scissors
winningOpposite Scissors = Rock