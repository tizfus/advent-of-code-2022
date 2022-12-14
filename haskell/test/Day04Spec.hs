module Day04Spec where

import Test.Hspec
import qualified Day04


tests :: Spec
tests =
  describe "Day 04:" $ do
    describe "Part ONE:" $ do
        it "assignments contain each other" $ do
            Day04.solutionPartOne "2-2,2-2" `shouldBe` "True"
            
            Day04.solutionPartOne "1-2,2-2" `shouldBe` "True"
            Day04.solutionPartOne "2-3,2-2" `shouldBe` "True"
            Day04.solutionPartOne "1-3,2-2" `shouldBe` "True"

            Day04.solutionPartOne "2-2,1-2" `shouldBe` "True"
            Day04.solutionPartOne "2-2,2-3" `shouldBe` "True"
            Day04.solutionPartOne "2-2,1-3" `shouldBe` "True"
            
            Day04.solutionPartOne "2-3,1-4" `shouldBe` "True"
            
            Day04.solutionPartOne "1-2,3-4" `shouldBe` "False"