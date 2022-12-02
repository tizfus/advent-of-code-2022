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
}