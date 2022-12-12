module Day03Spec where

import Test.Hspec
import qualified Day03
import Data.Foldable (forM_)


tests :: Spec
tests =
  describe "Day 03:" $ do
    describe "Part ONE:" $ do
      [("aa", "1"),
        ("bb", "2"),
        ("cc", "3"),
        ("dd", "4"),
        ("ee", "5"),
        ("ff", "6"),
        ("gg", "7"),
        ("hh", "8"),
        ("ii", "9"),
        ("jj", "10"),
        ("kk", "11"),
        ("ll", "12"),
        ("mm", "13"),
        ("nn", "14"),
        ("oo", "15"),
        ("pp", "16"),
        ("qq", "17"),
        ("rr", "18"),
        ("ss", "19"),
        ("tt", "20"),
        ("uu", "21"),
        ("vv", "22"),
        ("ww", "23"),
        ("xx", "24"),
        ("yy", "25"),
        ("zz", "26"),
        ("AA", "27"),
        ("BB", "28"),
        ("CC", "29"),
        ("DD", "30"),
        ("EE", "31"),
        ("FF", "32"),
        ("GG", "33"),
        ("HH", "34"),
        ("II", "35"),
        ("JJ", "36"),
        ("KK", "37"),
        ("LL", "38"),
        ("MM", "39"),
        ("NN", "40"),
        ("OO", "41"),
        ("PP", "42"),
        ("QQ", "43"),
        ("RR", "44"),
        ("SS", "45"),
        ("TT", "46"),
        ("UU", "47"),
        ("VV", "48"),
        ("WW", "49"),
        ("XX", "50"),
        ("YY", "51"),
        ("ZZ", "52" )]
          `forM_` (\(input, expected) -> 
          it ("returns the priority value for " ++ input) $ do
            Day03.solutionPartOne input `shouldBe` expected)
        
      it "return sum of multiple item priority" $ do
        Day03.solutionPartOne "aa\nbb" `shouldBe` "3"
