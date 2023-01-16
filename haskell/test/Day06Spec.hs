module Day06Spec where

import Test.Hspec
import qualified Day06

tests :: Spec
tests = 
    describe "Day 06:" $ do
        describe "Part ONE:" $ do
            it "return the index of the chunk without any repeated chars" $ do
                Day06.solutionPartOne "abbade" `shouldBe` "6"