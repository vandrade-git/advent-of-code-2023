defmodule AdventOfCode.Day08PartOne do
  defp navigate(directions, points) do
    directions
    |> Stream.cycle()
    |> Enum.reduce_while({"AAA", 0}, fn direction, {current_point, steps} ->
      {next_left_point, next_right_point} =
        points
        |> Map.get(current_point)

      next_point =
        case direction do
          "L" -> next_left_point
          "R" -> next_right_point
        end

      case next_point do
        "ZZZ" -> {:halt, steps + 1}
        _ -> {:cont, {next_point, steps + 1}}
      end
    end)
  end

  def run() do
    map =
      "resources/day_08.txt"
      |> File.read!()
      |> String.split("\n\n", trim: true)

    directions =
      map
      |> Enum.at(0)
      |> String.codepoints()

    points =
      map
      |> Enum.at(1)
      |> String.split("\n", trim: true)
      |> Enum.map(fn point -> String.split(point, " = ", trim: true) end)
      |> Map.new(fn [start, options] ->
        [left, right] =
          options
          |> String.split(["(", ", ", ")"], trim: true)

        {start, {left, right}}
      end)

    navigate(directions, points)
    |> IO.inspect(label: "Day 8 - Part 1")
  end
end

defmodule AdventOfCode.Day08PartTwo do
  defp least_common_multiple(0, 0) do
    0
  end

  defp least_common_multiple(left, right) do
    div(left * right, Integer.gcd(left, right))
  end

  defp navigate(directions, points) do
    points
    |> Enum.filter(fn {point, _} -> String.ends_with?(point, "A") end)
    |> Enum.map(fn {point, _} -> point end)
    |> Enum.map(fn starting_point ->
      directions
      |> Stream.cycle()
      |> Enum.reduce_while({starting_point, 0}, fn direction, {current_point, steps} ->
        {next_left_point, next_right_point} =
          points
          |> Map.get(current_point)

        next_point =
          case direction do
            "L" -> next_left_point
            "R" -> next_right_point
          end

        case String.ends_with?(next_point, "Z") do
          true -> {:halt, steps + 1}
          false -> {:cont, {next_point, steps + 1}}
        end
      end)
    end)
    |> Enum.reduce(1, fn step, accumulator -> least_common_multiple(step, accumulator) end)
  end

  def run() do
    map =
      "resources/day_08.txt"
      |> File.read!()
      |> String.split("\n\n", trim: true)

    directions =
      map
      |> Enum.at(0)
      |> String.codepoints()

    points =
      map
      |> Enum.at(1)
      |> String.split("\n", trim: true)
      |> Enum.map(fn point -> String.split(point, " = ", trim: true) end)
      |> Map.new(fn [start, options] ->
        [left, right] =
          options
          |> String.split(["(", ", ", ")"], trim: true)

        {start, {left, right}}
      end)

    navigate(directions, points)
    |> IO.inspect(label: "Day 8 - Part 2")
  end
end
