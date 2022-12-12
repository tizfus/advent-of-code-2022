import Day01
import Test.Hspec
import System.Environment (getArgs)
import Data.Maybe (listToMaybe)
import qualified Day01Spec
import qualified Day02Spec
import qualified Day03Spec


main :: IO ()
main = hspec $ do 
    Day01Spec.tests
    Day02Spec.tests
    Day03Spec.tests
