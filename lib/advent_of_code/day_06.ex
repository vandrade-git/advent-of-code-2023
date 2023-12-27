defmodule AdventOfCode.Day06PartOne do
  def run() do
    paper =
      "resources/day_06.txt"
      |> File.read!()
      |> String.split("\n", trim: true)

    times =
      paper
      |> Enum.at(0)
      |> String.split(["Time: ", " "], trim: true)
      |> Enum.map(fn time -> String.to_integer(time) end)

    distances =
      paper
      |> Enum.at(1)
      |> String.split(["Distance: ", " "], trim: true)
      |> Enum.map(fn distance -> String.to_integer(distance) end)

    Enum.zip(times, distances)
    |> Enum.map(fn {time, distance} ->
      0..time
      |> Enum.reduce(0, fn button_press_time, winning_times ->
        case button_press_time * (time - button_press_time) > distance do
          true -> winning_times + 1
          false -> winning_times
        end
      end)
    end)
    |> Enum.product()
    |> IO.inspect(label: "Day 6 - Part 1")
  end
end

defmodule AdventOfCode.Day06PartTwo do
  def run() do
    paper =
      "resources/day_06.txt"
      |> File.read!()
      |> String.split("\n", trim: true)

    time =
      paper
      |> Enum.at(0)
      |> String.split(["Time: ", " "], trim: true)
      |> Enum.map(fn time -> String.to_integer(time) end)

    distance =
      paper
      |> Enum.at(1)
      |> String.split(["Distance: ", " "], trim: true)
      |> Enum.map(fn distance -> String.to_integer(distance) end)

    0..time
    |> Enum.reduce(0, fn button_press_time, winning_times ->
      case button_press_time * (time - button_press_time) > distance do
        true -> winning_times + 1
        false -> winning_times
      end
    end)
    |> IO.inspect(label: "Day 6 - Part 2")
  end
end
