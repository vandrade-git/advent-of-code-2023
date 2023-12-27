#defmodule AdventOfCode.Day14PartOne do
#  defp tilt_and_calculate_load(platform, tilt_direction \\ :north) do
#    case tilt_direction do
#      :north ->
#        max_y =
#          platform
#          |> Enum.at(0)
#          |> Enum.count()
#
#        platform
#        |> Enum.map(fn column ->
#          column
#          |> Enum.with_index()
#          |> Enum.reduce([0, max_y], fn {element, index}, [column_load, previous_column_load] ->
#            case element do
#              "#" -> [column_load, max_y - index - 1]
#              "O" -> [column_load + previous_column_load, previous_column_load - 1]
#              "." -> [column_load, previous_column_load]
#            end
#          end)
#        end)
#        |> Enum.reduce(0, fn [column_load, _], total_load -> total_load + column_load end)
#
#      _ ->
#        platform
#    end
#  end
#
#  def run() do
#    platform =
#      "resources/day_14.txt"
#      |> File.read!()
#      |> String.split("\n", trim: true)
#      |> Enum.map(fn feature -> String.codepoints(feature) end)
#      |> Enum.zip()
#      |> Enum.map(fn column -> Tuple.to_list(column) end)
#      |> tilt_and_calculate_load()
#      |> IO.inspect(label: "Day 14 - Part 1")
#  end
#end
