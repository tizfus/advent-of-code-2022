module Day06Spec where

import Test.Hspec
import qualified Day06

tests :: Spec
tests = 
    describe "Day 06:" $ do
        describe "Part ONE:" $ do
            it "return the index of the chunk without any repeated chars" $ do
                Day06.solutionPartOne "abbade" `shouldBe` "6"

            it "example cases" $ do
                Day06.solutionPartOne "bvwbjplbgvbhsrlpgdmjqwftvncz" `shouldBe` "5"
                Day06.solutionPartOne "nppdvjthqldpwncqszvftbrmjlhg" `shouldBe` "6"
                Day06.solutionPartOne "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" `shouldBe` "10"
                Day06.solutionPartOne "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" `shouldBe` "11"
