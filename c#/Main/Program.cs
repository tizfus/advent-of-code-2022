
using System.IO;
using Lib;

string inputDay01 = System.IO.File.ReadAllText($"{AppDomain.CurrentDomain.BaseDirectory}input/day01");
Console.WriteLine(@$"Day01:
    Part One: {Day01.SolutionPartOne(inputDay01)}
    Part Two: {Day01.SolutionPartTwo(inputDay01)}
");
