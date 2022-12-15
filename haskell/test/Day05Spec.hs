module Day05Spec where

import Test.Hspec
import qualified Day05

tests :: Spec
tests = 
    describe "Day 05:" $ do
        describe "Part ONE:" $ do
            it "recognizes first row" $ do
                Day05.solutionPartOne "    [D]    " `shouldBe` "[Nothing,Just 'D',Nothing]"