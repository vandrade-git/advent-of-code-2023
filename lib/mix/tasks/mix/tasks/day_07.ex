defmodule Mix.Tasks.Day07 do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day07PartOne.run()
    AdventOfCode.Day07PartTwo.run()
  end
end
