import Day01
import Test.Hspec
import System.Environment (getArgs)
import qualified Day01Spec
import qualified Day02Spec
import qualified Day03Spec
import qualified Day04Spec


main :: IO ()
main = hspec $ do 
    Day01Spec.tests
    Day02Spec.tests
    Day03Spec.tests
    Day04Spec.tests
