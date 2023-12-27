defmodule AdventOfCode.Day07PartOne do
  defp find_hand_strength(hand) do
    hand
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.sort(:desc)
    |> case do
      [5] -> 7
      [4, 1] -> 6
      [3, 2] -> 5
      [3, 1, 1] -> 4
      [2, 2, 1] -> 3
      [2, 1, 1, 1] -> 2
      [1, 1, 1, 1, 1] -> 1
      _ -> 0
    end
  end

  def run() do
    "resources/day_07.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(fn play -> String.split(play, " ", trim: true) end)
    |> Enum.map(fn [raw_hand, bid] ->
      hand =
        raw_hand
        |> String.codepoints()
        |> Enum.map(fn card ->
          case card do
            "A" -> 14
            "K" -> 13
            "Q" -> 12
            "J" -> 11
            "T" -> 10
            _ -> String.to_integer(card)
          end
        end)

      {hand, String.to_integer(bid)}
    end)
    |> Enum.sort_by(fn {hand, _} -> {find_hand_strength(hand), hand} end, :asc)
    |> Enum.with_index(1)
    |> Enum.reduce(0, fn {{_, bid}, rank}, winnings -> winnings + bid * rank end)
    |> IO.inspect(label: "Day 7 - Part 1")
  end
end

defmodule AdventOfCode.Day07PartTwo do
  defp find_hand_strength(hand) do
    1..14
    |> Enum.map(fn joker_value ->
      hand
      |> Enum.map(fn card ->
        case card do
          1 -> joker_value
          _ -> card
        end
      end)
      |> Enum.frequencies()
      |> Map.values()
      |> Enum.sort(:desc)
      |> case do
           [5] -> 7
           [4, 1] -> 6
           [3, 2] -> 5
           [3, 1, 1] -> 4
           [2, 2, 1] -> 3
           [2, 1, 1, 1] -> 2
           [1, 1, 1, 1, 1] -> 1
           _ -> 0
         end
    end)
    |> Enum.max()
  end

  def run() do
    "resources/day_07.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(fn play -> String.split(play, " ", trim: true) end)
    |> Enum.map(fn [raw_hand, bid] ->
      hand =
        raw_hand
        |> String.codepoints()
        |> Enum.map(fn card ->
          case card do
            "A" -> 14
            "K" -> 13
            "Q" -> 12
            "T" -> 10
            "J" -> 1
            _ -> String.to_integer(card)
          end
        end)

      {hand, String.to_integer(bid)}
    end)
    |> Enum.sort_by(fn {hand, _} -> {find_hand_strength(hand), hand} end, :asc)
    |> Enum.with_index(1)
    |> Enum.reduce(0, fn {{_, bid}, rank}, winnings -> winnings + bid * rank end)
    |> IO.inspect(label: "Day 7 - Part 2")
  end
end
