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

        it "round end winning" $ do
            Day02.solutionPartOne "A Y" `shouldBe` "8"
            Day02.solutionPartOne "B Z" `shouldBe` "9"
            Day02.solutionPartOne "C X" `shouldBe` "7"

        it "round end loosing" $ do
            Day02.solutionPartOne "A Z" `shouldBe` "3"
            Day02.solutionPartOne "B X" `shouldBe` "1"
            Day02.solutionPartOne "C Y" `shouldBe` "2"

        it "sum scores multiple rounds" $ do
            Day02.solutionPartOne "A Z\nA Y" `shouldBe` "11"
            Day02.solutionPartOne "B X\nC Y" `shouldBe` "3"
