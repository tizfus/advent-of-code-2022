namespace Lib;

using System.Linq;

public class Day01
{
    public static string SolutionPartOne(string rawCalories) {
        return rawCalories.Split("\n\n")
            .Select(elvesCalories => 
                elvesCalories.Split("\n").Select(int.Parse).Sum())
            .Max()
            .ToString();
    }
}
