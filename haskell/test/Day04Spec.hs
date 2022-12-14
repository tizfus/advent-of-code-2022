module Day04Spec where

import Test.Hspec
import qualified Day04


tests :: Spec
tests =
  describe "Day 04:" $ do
    describe "Part ONE:" $ do
        it "first assignment contains the second" $ do
            Day04.solutionPartOne "2-2,2-2" `shouldBe` "True"
            Day04.solutionPartOne "1-2,2-2" `shouldBe` "True"
            Day04.solutionPartOne "2-3,2-2" `shouldBe` "True"
            Day04.solutionPartOne "1-3,2-2" `shouldBe` "True"
            Day04.solutionPartOne "2-2,1-3" `shouldBe` "False"