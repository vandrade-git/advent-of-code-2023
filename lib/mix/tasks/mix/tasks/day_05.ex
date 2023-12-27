defmodule Mix.Tasks.DayFive do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day05PartOne.run()
#    AdventOfCode.Day05PartTwo.run()
  end
end
