module Day06Spec where

import Test.Hspec
import qualified Day06

tests :: Spec
tests = 
    describe "Day 06:" $ do
        describe "Part ONE:" $ do
            it "reads the buffer by chunks of four" $ do
                Day06.solutionPartOne "abcdef" `shouldBe` "[\"abcd\",\"bcde\",\"cdef\"]"