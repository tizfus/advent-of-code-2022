module Day01Spec where

import Test.Hspec
import qualified Day01


tests :: Spec
tests =
  describe "Day 01" $ do
    it "return single number" $ do
        Day01.solution "100" `shouldBe` "100"

    it "sum for a Elve" $ do
        Day01.solution "100\n200" `shouldBe` "300"

    it "sum Elves' calories" $ do
        Day01.solution "100\n200\n\n50\n120" `shouldBe` "170"