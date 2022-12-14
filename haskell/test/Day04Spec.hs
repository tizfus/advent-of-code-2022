module Day04Spec where

import Test.Hspec
import qualified Day04


tests :: Spec
tests =
  describe "Day 04:" $ do
    describe "Part ONE:" $ do
        it "finds if one assignment contains the other" $ do
            Day04.solutionPartOne "2-2,2-2" `shouldBe` "1"
            
            Day04.solutionPartOne "1-2,2-2" `shouldBe` "1"
            Day04.solutionPartOne "2-3,2-2" `shouldBe` "1"
            Day04.solutionPartOne "1-3,2-2" `shouldBe` "1"

            Day04.solutionPartOne "2-2,1-2" `shouldBe` "1"
            Day04.solutionPartOne "2-2,2-3" `shouldBe` "1"
            Day04.solutionPartOne "2-2,1-3" `shouldBe` "1"
            
            Day04.solutionPartOne "2-3,1-4" `shouldBe` "1"
            
            Day04.solutionPartOne "1-2,3-4" `shouldBe` "0"

        it "sums how many assignments contain the other" $ do
          Day04.solutionPartOne "2-2,2-2\n3-5,1-2" `shouldBe` "1"
          Day04.solutionPartOne "3-5,1-2\n2-4,1-5" `shouldBe` "1"
          Day04.solutionPartOne "1-7,1-2\n2-4,1-5" `shouldBe` "2"

          Day04.solutionPartOne "1-2,3-4\n3-5,1-2" `shouldBe` "0"

        it "example case" $ do
          Day04.solutionPartOne "2-4,6-8\n\
            \2-3,4-5\n\
            \5-7,7-9\n\
            \2-8,3-7\n\
            \6-6,4-6\n\
            \2-6,4-8" 
          `shouldBe` "2"
     
    describe "Part TWO:" $ do
      it "finds if a assignment overlap with the other" $ do
        Day04.solutionPartTwo "1-2,2-3" `shouldBe` "1"
        Day04.solutionPartTwo "1-3,2-4" `shouldBe` "1"
        Day04.solutionPartTwo "1-3,4-5" `shouldBe` "0"