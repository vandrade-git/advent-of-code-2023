defmodule AdventOfCode.Day17PartOne do
  defp calculate_path(city_blocks, total_heat_loss, cumulative)

  defp calculate_path(city_blocks) do
    calculate_path(city_blocks, 0, 0)
  end

  def run() do
    city_blocks =
      "resources/day_17_tests.txt"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.with_index(1)
      |> Enum.flat_map(fn {row, row_index} ->
        row
        |> String.codepoints()
        |> Enum.map(fn value -> String.to_integer(value) end)
        |> Enum.with_index(fn heat_loss, column_index ->
          {{row_index, column_index}, heat_loss}
        end)
      end)
      |> Enum.reduce(%{}, fn {coordinates, heat_loss}, map ->
        Map.p
      end)
      |> IO.inspect()

    city_blocks
    |> Enum.reduce({0, 1}, fn {{x, y}, heat_loss}, {total_heat_loss, cumulative} ->

    end)
  end
end
