namespace Test;

using Lib;

public class Day01Test
{
    [Fact]
    public void PartOne_GivenASingleCalorie_ReturnIt()
    {
        Assert.Equal("100", Day01.SolutionPartOne("100"));
    }

    [Fact]
    public void PartOne_GivenCalories_SumThem()
    {
        Assert.Equal("350", Day01.SolutionPartOne("100\n200\n50"));
    }

    [Fact]
    public void PartOne_GivenCaloriesOfTheElves_ReturnTheHighestSum()
    {
        Assert.Equal("301", Day01.SolutionPartOne("100\n20\n50\n\n300\n1"));
    }

    [Fact]
    public void PartTwo_GivenCaloriesOfThreeElves_ReturnTheSum()
    {
        Assert.Equal("170", Day01.SolutionPartTwo("100\n\n20\n\n50"));
    }

    [Fact]
    public void PartTwo_GivenCaloriesOfFourElves_ReturnTheSumOfTheHighestThree()
    {
        Assert.Equal("350", Day01.SolutionPartTwo("100\n\n20\n\n50\n\n200"));
    }


}