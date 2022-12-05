namespace Lib;

using System.Linq;

public class Day01
{
    public static string SolutionPartOne(string rawCalories)
        => SumCaloriesOfEachElves(rawCalories)
            .Max()
            .ToString();

    public static string SolutionPartTwo(string rawCalories)
        => TakeHighestThree(SumCaloriesOfEachElves(rawCalories))
            .Sum()
            .ToString();

    public static IEnumerable<int> TakeHighestThree(IEnumerable<int> elvesCalories)
        => elvesCalories.OrderByDescending(calories => calories).Take(3);

    public static IEnumerable<string> SplitElvesCalories(string @string)
        => @string.Split("\n\n");

    public static int SumCalories(string rawCalories)
        => rawCalories.Split("\n").Select(int.Parse).Sum();
    
    public static IEnumerable<int> SumCaloriesOfEachElves(string rawCaloriesOfEachElves) 
        => SplitElvesCalories(rawCaloriesOfEachElves).Select(SumCalories);
    
}