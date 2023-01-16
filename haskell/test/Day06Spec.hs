module Day06Spec where

import Test.Hspec
import qualified Day06

tests :: Spec
tests = 
    describe "Day 06:" $ do
        describe "Part ONE:" $ do
            it "return the index of a chunk of 4 chars without any repeated chars" $ do
                Day06.solutionPartOne "abbade" `shouldBe` "6"

            it "example cases" $ do
                Day06.solutionPartOne "bvwbjplbgvbhsrlpgdmjqwftvncz" `shouldBe` "5"
                Day06.solutionPartOne "nppdvjthqldpwncqszvftbrmjlhg" `shouldBe` "6"
                Day06.solutionPartOne "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" `shouldBe` "10"
                Day06.solutionPartOne "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" `shouldBe` "11"

        describe "Part TWO:" $ do
            it "return the index of a chunk of 14 chars without any repeated chars" $ do
                Day06.solutionPartTwo "abcdefghijklmaopqrstuvwxyz" `shouldBe` "15"

            it "example cases" $ do
                
                Day06.solutionPartTwo "mjqjpqmgbljsphdztnvjfqwrcgsmlb" `shouldBe` "19"
                Day06.solutionPartTwo "bvwbjplbgvbhsrlpgdmjqwftvncz" `shouldBe` "23"
                Day06.solutionPartTwo "nppdvjthqldpwncqszvftbrmjlhg" `shouldBe` "23"
                Day06.solutionPartTwo "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" `shouldBe` "29"
                Day06.solutionPartTwo "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" `shouldBe` "26"                