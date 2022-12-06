input = File.read!("./lib/day2/input")

guide = Parse.parse(input) |> Enum.map(&String.split(&1, " "))

scoreMap = %{"A" => 1, "X" => 1, "B" => 2, "Y" => 2, "C" => 3, "Z" => 3}
# A,X = Rock
# B,Y = Paper
# C,Z = Scissors

score =
  Enum.map(guide, fn game ->
    case game do
      ["A", "X"] ->
        # even
        Map.get(scoreMap, "X") + 3

      ["B", "Y"] ->
        # even
        Map.get(scoreMap, "Y") + 3

      ["C", "Z"] ->
        # even
        Map.get(scoreMap, "Z") + 3

      ["A", "Y"] ->
        # win
        6 + Map.get(scoreMap, "Y")

      ["B", "Z"] ->
        # win
        6 + Map.get(scoreMap, "Z")

      ["C", "X"] ->
        # win
        6 + Map.get(scoreMap, "X")

      ["A", "Z"] ->
        # lose
        Map.get(scoreMap, "Z")

      ["B", "X"] ->
        # lose
        Map.get(scoreMap, "X")

      ["C", "Y"] ->
        # lose
        Map.get(scoreMap, "Y")
    end
  end)

IO.puts('Score: #{Enum.sum(score)}')

score =
  Enum.map(guide, fn game ->
    case game do
      ["A", "X"] ->
        # lose
        Map.get(scoreMap, "Z")

      ["B", "Y"] ->
        # even
        Map.get(scoreMap, "Y") + 3

      ["C", "Z"] ->
        # win
        Map.get(scoreMap, "X") + 6

      ["A", "Y"] ->
        # even
        Map.get(scoreMap, "X") + 3

      ["B", "Z"] ->
        # win
        Map.get(scoreMap, "Z") + 6

      ["C", "X"] ->
        # lose
        Map.get(scoreMap, "Y")

      ["A", "Z"] ->
        # win
        Map.get(scoreMap, "Y") + 6

      ["B", "X"] ->
        # lose
        Map.get(scoreMap, "X")

      ["C", "Y"] ->
        # even
        Map.get(scoreMap, "Z") + 3
    end
  end)

IO.inspect(score)
IO.puts('Score: #{Enum.sum(score)}')
