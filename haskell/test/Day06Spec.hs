module Day06Spec where

import Test.Hspec
import qualified Day06

tests :: Spec
tests = 
    describe "Day 06:" $ do
        describe "Part ONE:" $ do
            it "return the buffer by chunks of four with index" $ do
                Day06.solutionPartOne "abcdef" `shouldBe` "[(\"abcd\",4),(\"bcde\",5),(\"cdef\",6)]"