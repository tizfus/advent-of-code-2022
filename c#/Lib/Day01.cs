namespace Lib;

using System.Linq;

public class Day01
{
    public static string SolutionPartOne(string rawCalories) {
        return "" + rawCalories.Split('\n')
            .Select(int.Parse)
            .Sum();
    }
}
