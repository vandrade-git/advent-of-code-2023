defmodule Mix.Tasks.DayThree do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day03PartOne.run()
#    AdventOfCode.Day02PartTwo.run()
  end
end
