defmodule Mix.Tasks.Day06 do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day06PartOne.run()
    AdventOfCode.Day06PartTwo.run()
  end
end
