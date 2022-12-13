module Day04Spec where

import Test.Hspec
import qualified Day04


tests :: Spec
tests =
  describe "Day 04:" $ do
    describe "Part ONE:" $ do
        it "split assignemnts" $ do
            Day04.solutionPartOne "2-2,2-2" `shouldBe` "[2-2,2-2]"