module Day02Spec where

import Test.Hspec
import qualified Day02


tests :: Spec
tests =
  describe "Day 02:" $ do
    describe "Part ONE:" $ do
        it "return score for the shape selected" $ do
            Day02.solutionPartOne "X" `shouldBe` "1"
            Day02.solutionPartOne "Y" `shouldBe` "2"
            Day02.solutionPartOne "Z" `shouldBe` "3"
