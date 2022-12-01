module Day01Spec where

import Test.Hspec
import qualified Day01


tests :: Spec
tests =
  describe "Day 01" $ do
    it "return single number" $ do
        Day01.solution "100" `shouldBe` "100"

    it "sum single Elve calories" $ do
        Day01.solution "100\n200" `shouldBe` "300"

    it "return sum max 3 Elves' calories" $ do
        Day01.solution "100\n200\n1\n\n50\n120\n\n10" `shouldBe` "481"

    it "example test" $ do
        Day01.solution input `shouldBe` "45000"
            where input = "1000\n\
                \2000\n\
                \3000\n\n\

                \4000\n\n\

                \5000\n\
                \6000\n\n\

                \7000\n\
                \8000\n\
                \9000\n\n\

                \10000"