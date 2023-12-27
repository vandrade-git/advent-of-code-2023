defmodule AdventOfCode.Day18PartOne do
  def run() do
    dig_plan =
      "resources/day_18.txt"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(fn dig_step ->
        [direction, meters, _] =
          dig_step
          |> String.split(" ", trim: true)

        dig_step_direction =
          case direction do
            "U" -> :up
            "D" -> :down
            "L" -> :left
            "R" -> :right
          end

        dig_step_meters =
          meters
          |> String.to_integer()

        {dig_step_direction, dig_step_meters}
      end)

    dig_plan
    |> Enum.reduce_while({0, 0, 0}, fn {direction, meters}, {previous_x, previous_y, area} ->
      {next_x, next_y} =
        case direction do
          :up -> {previous_x, previous_y - meters}
          :down -> {previous_x, previous_y + meters}
          :left -> {previous_x - meters, previous_y}
          :right -> {previous_x + meters, previous_y}
        end

      next_area =
        area + (previous_x * next_y - previous_y * next_x) + meters

      case {next_x, next_y} do
        {0, 0} -> {:halt, div(next_area, 2) + 1}
        _ -> {:cont, {next_x, next_y, next_area}}
      end
    end)
    |> IO.inspect(label: "Day 18 - Part 1")
  end
end

defmodule AdventOfCode.Day18PartTwo do
  def run() do
    dig_plan =
      "resources/day_18.txt"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(fn dig_step ->
        [_, _, instruction] =
          dig_step
          |> String.split(" ", trim: true)

        {meters, direction} =
          instruction
          |> String.replace(["(", "#", ")"], "", trim: true)
          |> String.split_at(-1)

        dig_step_direction =
          case direction do
            "0" -> :right
            "1" -> :down
            "2" -> :left
            "3" -> :up
          end

        dig_step_meters =
          meters
          |> Integer.parse(16)
          |> case do
            {parsed, _} -> parsed
            :error -> 0
          end

        {dig_step_direction, dig_step_meters}
      end)

    dig_plan
    |> Enum.reduce_while({0, 0, 0}, fn {direction, meters}, {previous_x, previous_y, area} ->
      {next_x, next_y} =
        case direction do
          :up -> {previous_x, previous_y - meters}
          :down -> {previous_x, previous_y + meters}
          :left -> {previous_x - meters, previous_y}
          :right -> {previous_x + meters, previous_y}
        end

      next_area =
        area + (previous_x * next_y - previous_y * next_x) + meters

      case {next_x, next_y} do
        {0, 0} -> {:halt, div(next_area, 2) + 1}
        _ -> {:cont, {next_x, next_y, next_area}}
      end
    end)
    |> IO.inspect(label: "Day 18 - Part 2")
  end
end
