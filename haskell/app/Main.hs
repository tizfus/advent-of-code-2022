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
\3000\n\

\4000\n\

\5000\
\6000\n\

\7000\
\8000\
\9000\n\

\10000"
  