defmodule Mix.Tasks.Day15 do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day15PartOne.run()
    AdventOfCode.Day15PartTwo.run()
  end
end
