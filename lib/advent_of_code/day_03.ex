defmodule AdventOfCode.Day03PartOne do
  defp find_engine_parts([], _previous, engine_parts) do
    engine_parts
  end

  defp find_engine_parts([head | tail], previous, engine_parts) do
    Regex.scan(~r/[[:digit:]]+/, head, return: :index)
    |> Enum.flat_map(fn match -> match end)
    |> Enum.reduce([], fn {index, length}, part_numbers ->
      (String.slice(previous || "", max(0, index - 1), length + 2) <>
       String.slice(head, max(0, index - 1), length + 2) <>
       String.slice(Enum.at(tail, 0) || "", max(0, index - 1), length + 2))
      |> (&Regex.match?(~r/[^.[:digit:]]/, &1)).()
      |> case do
        true ->
          String.slice(head, index, length)
          |> Integer.parse()
          |> case do
            {parsed, _} -> [parsed | part_numbers]
            :error -> part_numbers
          end

        false ->
          part_numbers
      end
    end)
    |> (&(find_engine_parts(tail, head, engine_parts ++ &1))).()
  end

  def find_engine_parts(sections) do
    find_engine_parts(sections, nil, [])
  end

  def run() do
    File.read!("resources/day_three.txt")
    |> String.split("\n", trim: true)
    |> find_engine_parts()
    |> Enum.sum()
    |> IO.inspect(label: "Day 3 - Part 1")
  end
end
