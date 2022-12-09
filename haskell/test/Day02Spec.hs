module Day02Spec where

import Test.Hspec
import qualified Day02


tests :: Spec
tests =
  describe "Day 02:" $ do
    describe "Part ONE:" $ do
        it "recognize aliases" $ do
            Day02.solutionPartOne "A" `shouldBe` "Rock"
            Day02.solutionPartOne "X" `shouldBe` "Rock"

            Day02.solutionPartOne "B" `shouldBe` "Paper"
            Day02.solutionPartOne "Y" `shouldBe` "Paper"

            Day02.solutionPartOne "C" `shouldBe` "Scissors"
            Day02.solutionPartOne "Z" `shouldBe` "Scissors"
