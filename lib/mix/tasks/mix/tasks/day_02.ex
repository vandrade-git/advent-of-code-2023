defmodule Mix.Tasks.DayTwo do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day02PartOne.run()
    AdventOfCode.Day02PartTwo.run()
  end
end
