module Day05Spec where

import Test.Hspec
import qualified Day05

tests :: Spec
tests = 
    describe "Day 05:" $ do
        describe "Part ONE:" $ do
            it "recognizes first row" $ do
                Day05.solutionPartOne "    [D]    " `shouldBe` "[[],[\"D\"],[]]"
                Day05.solutionPartOne "    [D]     [C]" `shouldBe` "[[],[\"D\"],[],[\"C\"]]"
            
            it "reads multiple rows" $ do
                Day05.solutionPartOne "    [D]    \n[N] [C]    "
                    `shouldBe` "[[\"N\"],[\"D\",\"C\"],[]]"