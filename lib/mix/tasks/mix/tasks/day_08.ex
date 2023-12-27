defmodule Mix.Tasks.Day08 do
  use Mix.Task

  def run(_args) do
    AdventOfCode.Day08PartOne.run()
    AdventOfCode.Day08PartTwo.run()
  end
end
