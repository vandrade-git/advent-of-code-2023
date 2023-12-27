defmodule Mix.Tasks.DayOne do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day01PartOne.run()
    AdventOfCode.Day01PartTwo.run()
  end
end
