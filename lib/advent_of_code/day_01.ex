# Part 1 >>
defmodule AdventOfCode.Day01PartOne do
  defp extract_calibration_value("", nil, nil) do
    0
  end

  defp extract_calibration_value("", first, last) do
    first * 10 + last
  end

  defp extract_calibration_value(puzzle, first, _last) do
    case first do
      nil ->
        puzzle
        |> String.first()
        |> Integer.parse()
        |> case do
          {parsed, _} -> extract_calibration_value(String.slice(puzzle, 1..-1), parsed, parsed)
          :error -> extract_calibration_value(String.slice(puzzle, 1..-1), nil, nil)
        end

      _ ->
        puzzle
        |> String.last()
        |> Integer.parse()
        |> case do
          {parsed, _} -> extract_calibration_value("", first, parsed)
          :error -> extract_calibration_value(String.slice(puzzle, 0..-2), first, first)
        end
    end
  end

  def extract_calibration_value(puzzle) do
    extract_calibration_value(puzzle, nil, nil)
  end

  def run() do
    File.read!("resources/day_one.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn line -> extract_calibration_value(line) end)
    |> Enum.sum()
    |> IO.inspect(label: "Day 1 - Part 1")
  end
end

# << Part 1

# Part 2 >>
defmodule AdventOfCode.Day01PartTwo do
  @numbers %{
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }

  defp replace_spelled("", replaced) do
    replaced
  end

  defp replace_spelled(text, replaced) do
    String.starts_with?(text, Map.values(@numbers))
    |> case do
      true ->
        replace_spelled(String.slice(text, 1..-1), replaced <> String.slice(text, 0..0))

      false ->
        String.starts_with?(text, Map.keys(@numbers))
        |> case do
          true ->
            String.replace(text, Map.keys(@numbers), fn match -> @numbers[match] end,
              global: false
            )
            |> (&String.slice(text, 0..-String.length(&1))).()
            |> (&replace_spelled(String.slice(text, 1..-1), replaced <> @numbers[&1])).()

          false ->
            replace_spelled(String.slice(text, 1..-1), replaced)
        end
    end
  end

  def replace_spelled(text) do
    replace_spelled(text, "")
  end

  defp extract_calibration_value("", nil, nil) do
    0
  end

  defp extract_calibration_value("", first, last) do
    first * 10 + last
  end

  defp extract_calibration_value(puzzle, first, _last) do
    case first do
      nil ->
        puzzle
        |> String.first()
        |> Integer.parse()
        |> case do
          {parsed, _} -> extract_calibration_value(String.slice(puzzle, 1..-1), parsed, parsed)
          :error -> extract_calibration_value(String.slice(puzzle, 1..-1), nil, nil)
        end

      _ ->
        puzzle
        |> String.last()
        |> Integer.parse()
        |> case do
          {parsed, _} -> extract_calibration_value("", first, parsed)
          :error -> extract_calibration_value(String.slice(puzzle, 0..-2), first, first)
        end
    end
  end

  def extract_calibration_value(puzzle) do
    extract_calibration_value(puzzle, nil, nil)
  end

  def run() do
    File.read!("resources/day_one.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn line -> extract_calibration_value(replace_spelled(line)) end)
    |> Enum.sum()
    |> IO.inspect(label: "Day 1 - Part 2")
  end
end

# << Part 2
