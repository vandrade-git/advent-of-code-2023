defmodule Mix.Tasks.Day18 do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day18PartOne.run()
    AdventOfCode.Day18PartTwo.run()
  end
end
