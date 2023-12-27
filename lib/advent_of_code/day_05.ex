#defmodule AdventOfCode.Day05PartOne do
#  defp find_location(seed, []) do
#    seed
#  end
#
#  defp find_location(seed, [map | maps]) do
#    #    IO.inspect(map)
#    #
#    #    case Enum.find(map, fn {_, source, range} -> seed in source..(source + range - 1) end) do
#    #      #      nil -> find_location(seed, maps)
#    #      #      {destination, source, _} -> find_location(destination + seed - source, maps)
#    ##      _ -> find_location(seed, [])
#    #    end
#
#    find_location(seed, maps)
#  end
#
#  def run() do
#    almanac =
#      File.read!("resources/day_five.txt")
#      |> String.split("\n\n", trim: true)
#
#    seeds =
#      hd(almanac)
#      |> String.split(["seeds: ", " "], trim: true)
#      |> Enum.map(fn raw_seed -> String.to_integer(raw_seed) end)
#
#    maps =
#      tl(almanac)
#      |> Enum.map(fn raw_map ->
#        String.split(raw_map, [": ", "\n"], trim: true)
#        |> tl()
#        |> Enum.map(fn raw_map_line ->
#          raw_map_line
#          |> String.split(" ", trim: true)
#          |> Enum.map(fn raw_map_line_entry -> String.to_integer(raw_map_line_entry) end)
#        end)
#        |> Enum.map(fn [destination, source, range] -> {destination, source, range} end)
#      end)
#
#    Benchee.run(%{
#      "day_05_part_1" => fn ->
#        Enum.reduce(seeds, :infinity, fn seed, minimum ->
#          case find_location(seed, maps) do
#            location when location < minimum -> location
#            _ -> minimum
#          end
#        end)
#
#        #        |> IO.inspect(label: "Day 5 - Part 1")
#      end
#    })
#  end
#end
#
#defmodule AdventOfCode.Day05PartTwo do
#  defp find_location(seed, []) do
#    seed
#  end
#
#  defp find_location(seed, [map | maps]) do
#    #    case Enum.find(map, fn {_, source, range} -> seed in source..(source + range - 1) end) do
#    #      nil -> find_location(seed, maps)
#    #      {destination, source, _} -> find_location(destination + seed - source, maps)
#    #    end
#
#    find_location(seed, maps)
#  end
#
#  def run() do
#    almanac =
#      File.read!("resources/day_five.txt")
#      |> String.split("\n\n", trim: true)
#
#    seed_ranges =
#      hd(almanac)
#      |> String.split(["seeds: ", " "], trim: true)
#      |> Enum.map(fn raw_seed -> String.to_integer(raw_seed) end)
#      |> Enum.chunk_every(2)
#      |> Enum.map(fn [seed, range] -> {seed, range} end)
#
#    maps =
#      tl(almanac)
#      |> Enum.map(fn raw_map ->
#        String.split(raw_map, [": ", "\n"], trim: true)
#        |> tl()
#        |> Enum.map(fn raw_map_line ->
#          raw_map_line
#          |> String.split(" ", trim: true)
#          |> Enum.map(fn raw_map_line_entry -> String.to_integer(raw_map_line_entry) end)
#        end)
#        |> Enum.map(fn [destination, source, range] -> {destination, source, range} end)
#      end)
#
#    #    Enum.map(seed_ranges, fn {seed, range} ->
#    #      seed..(seed + range - 1)
#    #      |> Range.to_list()
#    #      |> IO.inspect()
#    #      |> Enum.map(fn seed -> find_location(seed, maps) end)
#    #      |> Enum.min()
#    #    end)
#    #    |> IO.inspect(label: "Day 5 - Part 2")
#
#    Benchee.run(%{
#      "day_05_part_2" => fn ->
#        Enum.map(seed_ranges, fn {starting_seed, range} ->
#          starting_seed..(starting_seed + range - 1)
#          |> Stream.chunk_every(1000)
#          |> Stream.map(fn seeds_chunk ->
#            #        IO.inspect(seeds_chunk)
#            #                Enum.reduce(seeds_chunk, :infinity, fn seed, minimum_location ->
#            ##                  case find_location(seed, maps) do
#            ##                    location when location < minimum_location -> location
#            ##                    _ -> minimum_location
#            ##                  end
#            #                  minimum_location
#            #                end)
#            Enum.map(seeds_chunk, fn seed -> find_location(seed, maps) end)
#            |> Enum.min()
#          end)
#          |> Enum.min()
#
#          #              |> IO.inspect(label: "#{DateTime.utc_now()}")
#        end)
#        |> Enum.min()
#        |> IO.inspect(label: "Day 5 - Part 2")
#      end
#    })
#
#    #    Enum.map(seed_ranges, fn {seed, range} ->
#    #      seed..(seed + range - 1)
#    #      |> IO.inspect()
#    #      #          |> Range.to_list()
#    #      |> Enum.reduce({seed, :infinity}, fn seed_range, {current_seed, minimum} ->
#    #        IO.inspect(seed)
#    #        IO.inspect(range)
#    #        IO.inspect(seed_range)
#    #        case current_seed in seed_range do
#    #          _ -> {nil, nil}
#    ##          true ->
#    ##            case find_location(current_seed , maps) do
#    ##              location when location < minimum -> {current_seed + 1, location}
#    ##              _ -> {current_seed + 1, minimum}
#    ##            end
#    ##
#    ##          false ->
#    ##            {:infinity, minimum}
#    #        end
#    #      end)
#    #      |> IO.inspect()
#    #    end)
#    #    |> Enum.min()
#    #    |> IO.inspect(label: "Day 5 - Part 2")
#  end
#end
