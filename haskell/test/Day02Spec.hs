module Day02Spec where

import Test.Hspec
import qualified Day02


tests :: Spec
tests =
  describe "Day 02:" $ do
    describe "Part ONE:" $ do
        it "round end with a draw" $ do
            Day02.solutionPartOne "A X" `shouldBe` "4"
            Day02.solutionPartOne "B Y" `shouldBe` "5"
            Day02.solutionPartOne "C Z" `shouldBe` "6"
