module Day02 (solutionPartOne, solutionPartTwo) where

data Selection = Rock | Paper | Scissors
type Round = (Selection, Selection)

solutionPartOne :: String -> String
solutionPartOne = roundsResult readRound

roundsResult :: (String -> Round) -> String -> String  
roundsResult readRoundStrategy =
    show
    . sum
    . map (uncurry score . readRoundStrategy)
    . lines

readRounds :: (String -> Round) -> String -> [Round]
readRounds strategy = map strategy . lines

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


type Action = (Selection -> Selection)

solutionPartTwo :: String -> String
solutionPartTwo = roundsResult readRound2

readRound2 :: String -> Round
readRound2 raw =
    let [rawElfChoise, rawAction] = words raw
        elfChoise = readSelection rawElfChoise
        action = readAction rawAction
    in (elfChoise, action elfChoise)

readAction :: String -> Action
readAction "X" = loose
readAction "Y" = draw
readAction "Z" = win

draw :: Selection -> Selection
draw = id

loose :: Selection -> Selection
loose Rock = Scissors
loose Paper = Rock
loose Scissors = Paper

win :: Selection -> Selection
win Rock = Paper
win Paper = Scissors
win Scissors = Rock