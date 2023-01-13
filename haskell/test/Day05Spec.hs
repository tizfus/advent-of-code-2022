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
                    `shouldBe` "D"

                Day05.solutionPartOne "    [D]     [C]\
                                    \\n 1   2   3   4 "
                    `shouldBe` "DC"

            it "read stacks without move information" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n[N] [C]    \
                                    \\n 1   2   3 "
                    `shouldBe` "ND"

            it "single movement with single container" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n 1   2   3 \
                                    \\n\
                                    \\nmove 1 from 2 to 1" 
                    `shouldBe` "D"

            it "multiple movement with single container" $ do
                Day05.solutionPartOne "    [D]    \
                                    \\n 1   2   3 \
                                    \\n\
                                    \\nmove 1 from 2 to 1\
                                    \\nmove 1 from 1 to 2\
                                    \\nmove 1 from 2 to 3" 
                    `shouldBe` "D"

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
                    `shouldBe` "CMZ"

                Day05.solutionPartOne "        [L]\    
                                    \\n    [R] [N]\
                                    \\n[B] [F] [P]\
                                    \\n 1   2   3 \
                                    \\n\
                                    \\nmove 2 from 2 to 1\
                                    \\nmove 2 from 3 to 1" 
                    `shouldBe` "NP"

                Day05.solutionPartOne "[B]                     [N]     [H]\
                                    \\n[V]         [P] [T]     [V]     [P]\
                                    \\n[W]     [C] [T] [S]     [H]     [N]\
                                    \\n[T]     [J] [Z] [M] [N] [F]     [L]\
                                    \\n[Q]     [W] [N] [J] [T] [Q] [R] [B]\
                                    \\n[N] [B] [Q] [R] [V] [F] [D] [F] [M]\
                                    \\n[H] [W] [S] [J] [P] [W] [L] [P] [S]\
                                    \\n[D] [D] [T] [F] [G] [B] [B] [H] [Z]\
                                    \\n 1   2   3   4   5   6   7   8   9 \
                                    \\n\
                                    \\nmove 2 from 8 to 1\
                                    \\nmove 4 from 9 to 8" 
                    `shouldBe` "FBCPTNNLB"

        describe "Part TWO:" $ do
            it "multiple movement with multiple container" $ do
                    Day05.solutionPartTwo "    [D]    \    
                                        \\n[N] [C]    \
                                        \\n[Z] [M] [P]\
                                        \\n 1   2   3 \
                                        \\n\
                                        \\nmove 1 from 2 to 1\
                                        \\nmove 3 from 1 to 3\
                                        \\nmove 2 from 2 to 1\
                                        \\nmove 1 from 1 to 2" 
                        `shouldBe` "MCD"
