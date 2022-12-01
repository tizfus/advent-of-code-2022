import qualified Day01


main :: IO ()
main = do
    putStrLn "###################"
    day01

day01 :: IO ()
day01 =
  putStrLn $ "Day 01: " ++ Day01.solution input
    where input = "1000\
\2000\
\3000\
\\
\4000\
\\
\5000\
\6000\
\\
\7000\
\8000\
\9000\
\\
\10000"
  