
using System.IO;
using Lib;

string inputDay01 = System.IO.File.ReadAllText($"{AppDomain.CurrentDomain.BaseDirectory}input/day01");
Console.WriteLine($"Day01: {Day01.SolutionPartOne(inputDay01)}");
