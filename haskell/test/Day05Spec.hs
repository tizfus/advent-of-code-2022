module Day05Spec where

import Test.Hspec
import qualified Day05

tests :: Spec
tests = 
    describe "Day 05:" $ do
        describe "Part ONE:" $ do
            it "read stack without move information" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n 1   2   3 " 
                    `shouldBe` "[[\"D\"]]"

                Day05.solutionPartOne "    [D]     [C]\
                                    \\n 1   2   3   4 "
                    `shouldBe` "[[\"D\"],[\"C\"]]"

            it "read stacks without move information" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n[N] [C]    \
                                    \\n 1   2   3 "
                    `shouldBe` "[[\"N\"],[\"D\",\"C\"]]"

            it "single movement with single container" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n 1   2   3 \
                                    \\n\
                                    \\nmove 1 from 2 to 1" 
                    `shouldBe` "[[\"D\"]]"

            it "multiple movement with single container" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n 1   2   3 \
                                    \\n\
                                    \\nmove 1 from 2 to 1\
                                    \\nmove 1 from 1 to 2\
                                    \\nmove 1 from 2 to 3" 
                    `shouldBe` "[[\"D\"]]"

            it "multiple movement with multiple container" $ do
                Day05.solutionPartOne "    [D]    \    
                                    \\n[N] [C]    \
                                    \\n[Z] [M] [P]\
                                    \\n 1   2   3 \
                                    \\n\
                                    \\nmove 1 from 2 to 1\
                                    \\nmove 3 from 1 to 3\
                                    \\nmove 2 from 2 to 1\
                                    \\nmove 1 from 1 to 2" 
                    `shouldBe` "[[\"C\"],[\"M\"],[\"Z\",\"N\",\"D\",\"P\"]]"


