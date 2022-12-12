module Day03Spec where

import Test.Hspec
import qualified Day03


tests :: Spec
tests =
  describe "Day 03:" $ do
    describe "Part ONE:" $ do
        it "returns the item present in both compartments" $ do
            Day03.solutionPartOne "vJrwpWtwJgWrhcsFMMfFFhFp" `shouldBe` "p"

