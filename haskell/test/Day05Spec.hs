module Day05Spec where

import Test.Hspec
import qualified Day05

tests :: Spec
tests = 
    describe "Day 05:" $ do
        describe "Part ONE:" $ do
            it "recognizes single row" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n 1   2   3 \
                                    \\n\
                                    \\nmove 1 from 2 to 1" 
                    `shouldBe` "[[],[\"D\"],[]]"

                Day05.solutionPartOne "    [D]     [C]\
                                    \\n 1   2   3   4 "
                    `shouldBe` "[[],[\"D\"],[],[\"C\"]]"

            it "reads multiple rows" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n[N] [C]    \
                                    \\n 1   2   3 "
                    `shouldBe` "[[\"N\"],[\"D\",\"C\"],[]]"