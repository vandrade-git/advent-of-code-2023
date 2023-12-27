defmodule AdventOfCode.Day02PartOne do
  defp solve_game([], max_red, max_green, max_blue) do
    cond do
      max_red > 12 -> 0
      max_green > 13 -> 0
      max_blue > 14 -> 0
      true -> 1
    end
  end

  defp solve_game([{count, color} | tail], max_red, max_green, max_blue) do
    case color do
      "red" -> solve_game(tail, max(String.to_integer(count), max_red), max_green, max_blue)
      "green" -> solve_game(tail, max_red, max(String.to_integer(count), max_green), max_blue)
      "blue" -> solve_game(tail, max_red, max_green, max(String.to_integer(count), max_blue))
    end
  end

  def solve_game(game) do
    game
    |> String.replace([", ", "; "], ",")
    |> String.split(",")
    |> Enum.map(fn roll ->
      roll
      |> String.split(" ")
      |> List.to_tuple()
    end)
    |> solve_game(0, 0, 0)
  end

  def run() do
    File.read!("resources/day_two.txt")
    |> String.split("\n", trim: true)
    |> Enum.with_index(1)
    |> Enum.map(fn {line, line_number} ->
      {String.trim_leading(line, "Game #{line_number}: "), line_number}
    end)
    |> Enum.reduce(0, fn {game, game_number}, count -> count + game_number * solve_game(game) end)
    |> IO.inspect(label: "Day 2 - Part 1")
  end

  #    |> Enum.map(fn line -> String.split(line, ": ") end)
  #    |> Enum.map(fn line -> List.to_tuple(line) end)
  #    |> Enum.map(fn line -> {String.to_integer(String.trim_leading(elem(line, 0), "Game ")), elem(line, 1)} end)
  #    |> Enum.reduce(0, fn line, count -> count + elem(line, 0) * solve_game(elem(line, 1)) end)
end

defmodule AdventOfCode.Day02PartTwo do
  defp solve_game([], min_red, min_green, min_blue) do
    {min_red, min_green, min_blue}
  end

  defp solve_game([{count, color} | tail], min_red, min_green, min_blue) do
    case color do
      "red" -> solve_game(tail, max(String.to_integer(count), min_red), min_green, min_blue)
      "green" -> solve_game(tail, min_red, max(String.to_integer(count), min_green), min_blue)
      "blue" -> solve_game(tail, min_red, min_green, max(String.to_integer(count), min_blue))
    end
  end

  def solve_game(game) do
    game
    |> String.replace([", ", "; "], ",")
    |> String.split(",")
    |> Enum.map(fn roll ->
      roll
      |> String.split(" ")
      |> List.to_tuple()
    end)
    |> solve_game(0, 0, 0)
  end

  def run() do
    File.read!("resources/day_two.txt")
    |> String.split("\n", trim: true)
    |> Enum.with_index(1)
    |> Enum.map(fn {line, line_number} ->
      {String.trim_leading(line, "Game #{line_number}: "), line_number}
    end)
    |> Enum.reduce(0, fn {game, _game_number}, count ->
      count + Tuple.product(solve_game(game))
    end)
    |> IO.inspect(label: "Day 2 - Part 2")
  end
end
