defmodule AdventOfCode.Day04PartOne do
  def run() do
    File.read!("resources/day_four.txt")
    |> String.split("\n", trim: true)
    |> Enum.with_index(1)
    |> Enum.map(fn {line, line_number} ->
      String.trim_leading(line, "Card #{line_number}: ")
      |> String.split([" | ", " "], trim: true)
    end)
    |> Enum.map(fn card -> length(card) - length(Enum.uniq(card)) end)
    |> Enum.reduce(0, fn card_score, total_score ->
      case card_score do
        0 -> total_score
        _ -> total_score + Integer.pow(2, card_score - 1)
      end
    end)
    |> IO.inspect(label: "Day 4 - Part 1")
  end
end

defmodule AdventOfCode.Day04PartTwo do
  defp play_scratch_game([], _original_cards, total_cards) do
    total_cards
  end

  defp play_scratch_game([head | tail], original_cards, total_cards) do
    case length(head) - length(Enum.uniq(head)) do
      0 ->
        play_scratch_game(tail, original_cards, total_cards)

      _amount ->
        IO.inspect(original_cards)
#        play_scratch_game(
#          Enum.slice(tail, 0, amount) ++ tail,
#          original_cards,
#          total_cards + 1
#        )
    end
  end

  def play_scratch_game(cards) do
    play_scratch_game(cards, cards, 0)
  end

  def run() do
    File.read!("resources/day_four_tests.txt")
    |> String.split("\n", trim: true)
    |> Enum.with_index(1)
    |> Enum.map(fn {line, line_number} ->
      String.trim_leading(line, "Card #{line_number}: ")
      |> String.split([" | ", " "], trim: true)
    end)
#    |> Enum.map(fn card -> length(card) - length(Enum.uniq(card)) end)
    |> play_scratch_game()
    #    |> (&(&1 ++ &1)).()
#    |> IO.inspect(label: "Day 4 - Part 2")
  end
end
