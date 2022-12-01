import Day01
import Test.Hspec
import System.Environment (getArgs)
import Data.Maybe (listToMaybe)
import qualified Day01Spec


main :: IO ()
main = hspec $ Day01Spec.tests
