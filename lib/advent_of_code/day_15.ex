defmodule AdventOfCode.Day15PartOne do
  def run() do
    "resources/day_15.txt"
    |> File.read!()
    |> String.split(["\n", ","], trim: true)
    |> Enum.map(fn string ->
      string
      |> String.codepoints()
      |> Enum.reduce(0, fn character, current_value ->
        rem((current_value + :binary.first(character)) * 17, 256)
      end)
    end)
    |> Enum.sum()
    |> IO.inspect(label: "Day 15 - Part 1")
  end
end

defmodule AdventOfCode.Day15PartTwo do
  def run() do
    "resources/day_15.txt"
    |> File.read!()
    |> String.split(["\n", ","], trim: true)
    |> Enum.map(fn string ->
      [label, raw_focal_length] =
        string
        |> String.split(["=", "-"])

      box =
        label
        |> String.codepoints()
        |> Enum.reduce(0, fn character, current_value ->
          rem((current_value + :binary.first(character)) * 17, 256)
        end)

      focal_length =
        raw_focal_length
        |> Integer.parse()
        |> case do
          {parsed, _} -> parsed
          :error -> :remove
        end

      {box, label, focal_length}
    end)
    |> Enum.reduce(%{}, fn {box, label, focal_length}, map ->
      Map.update(map, box, [{label, focal_length}], fn lenses ->
        case Enum.find_index(lenses, fn {existing_label, _} -> existing_label == label end) do
          nil ->
            case focal_length do
              :remove -> lenses
              _ -> lenses ++ [{label, focal_length}]
            end

          index ->
            case focal_length do
              :remove -> List.delete_at(lenses, index)
              _ -> List.replace_at(lenses, index, {label, focal_length})
            end
        end
      end)
    end)
    |> Enum.reduce(0, fn {box, lenses}, focusing_power ->
      lenses
      |> Enum.with_index(1)
      |> Enum.reduce(focusing_power, fn {{_, focal_length}, index}, box_focusing_power ->
        box_focusing_power + ((box + 1) * index * focal_length)
      end)
    end)
    |> IO.inspect(label: "Day 15 - Part 1")
  end
end
