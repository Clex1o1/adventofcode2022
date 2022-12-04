input = File.read!('input')

defmodule Parse do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
  end
end

input = Parse.parse(input)

scoreMap = %{'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8, 'i' => 9, 'j' => 10, 'k' => 11, 'l' => 12, 'm' => 13, 'n' => 14, 'o' => 15, 'p' => 16, 'q' => 17, 'r' => 18, 's' => 19, 't' => 20, 'u' => 21, 'v' => 22, 'w' => 23, 'x' => 24, 'y' => 25, 'z' => 26, 'A' => 27, 'B' => 28, 'C' => 29, 'D' => 30, 'E' => 31, 'F' => 32, 'G' => 33, 'H' => 34, 'I' => 35, 'J' => 36, 'K' => 37, 'L' => 38, 'M' => 39, 'N' => 40, 'O' => 41, 'P' => 42, 'Q' => 43, 'R' => 44, 'S' => 45, 'T' => 46, 'U' => 47, 'V' => 48, 'W' => 49, 'X' => 50, 'Y' => 51, 'Z' => 52}
compartments= Enum.map(input, fn(compartment) ->
  length = div(String.length(compartment), 2)
  compartment1 = String.slice(compartment, 0, length)
  compartment2 = String.slice(compartment, length, length)
  Enum.map(String.to_charlist(compartment1), fn(char) ->
    if String.contains?(compartment2, List.to_string([char])) do
      char
    end
   end)
   |> Enum.filter(fn(x) -> x != nil end)
end)

compartments = Enum.map(compartments, fn(compartment) ->
  Enum.uniq(compartment)
end)


score = Enum.map(compartments, fn(compartment) ->
  Map.get(scoreMap, compartment)
end)


IO.puts('Score: #{Enum.sum(score)}')


groups = Enum.chunk_every(input, 3)

# same char in each group
groups = Enum.map(groups, fn(group) ->
  Enum.map(group, fn(item) ->
    String.to_charlist(item)
  end)
  |> Enum.reduce(fn(x, acc) ->
    Enum.filter(x, fn(char) ->
      Enum.member?(acc, char)
    end)
    |> Enum.uniq
  end)
end)

score = Enum.map(groups, fn(group) ->
  Map.get(scoreMap, group)
end)
IO.puts('Score: #{Enum.sum(score)}')
