module Day01Spec where

import Test.Hspec
import qualified Day01


tests :: Spec
tests =
  describe "Day 01" $ do
    it "return single number" $ do
        Day01.solution "100" `shouldBe` "100"