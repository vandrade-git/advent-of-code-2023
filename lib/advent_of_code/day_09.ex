defmodule AdventOfCode.Day09PartOne do
  defp testing([first_value | []], sequence) do
    sequence
  end

  defp testing([first_value | [second_value | history]], sequence) do
    testing([second_value | history], sequence ++ [second_value - first_value])
  end

  defp testing(history) do
#    Enum.reduce()
    testing(history, [])
  end

  def run() do
    report =
      "resources/day_09_tests.txt"
      |> File.read!()
      |> String.split("\n", trim: true)

    histories =
      report
      |> Enum.map(fn history ->
        history
        |> String.split(" ", trim: true)
        |> Enum.map(fn value -> String.to_integer(value) end)
      end)

#    histories
#    |> Enum.map(fn history ->
#      testing(history)
#      |> IO.inspect()
#      |> testing()
#    end)
#    |> IO.inspect()

    histories
    |> Enum.reduce([], fn history, sequences ->
      [testing(history) | sequences]
    end)
    |> IO.inspect()
  end
end
