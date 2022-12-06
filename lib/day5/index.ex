input = File.read!("./lib/day5/input")

defmodule Parse do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
  end
end

input = Parse.parse(input)

# [M]                     [N] [Z]
# [F]             [R] [Z] [C] [C]
# [C]     [V]     [L] [N] [G] [V]
# [W]     [L]     [T] [H] [V] [F] [H]
# [T]     [T] [W] [F] [B] [P] [J] [L]
# [D] [L] [H] [J] [C] [G] [S] [R] [M]
# [L] [B] [C] [P] [S] [D] [M] [Q] [P]
# [B] [N] [J] [S] [Z] [W] [F] [W] [R]
#  1   2   3   4   5   6   7   8   9

crates = %{
  1 => ["B", "L", "D", "T", "W", "C", "F", "M"],
  2 => ["N", "B", "L"],
  3 => ["J", "C", "H", "T", "L", "V"],
  4 => ["S", "P", "J", "W"],
  5 => ["Z", "S", "C", "F", "T", "L", "R"],
  6 => ["W", "D", "G", "B", "H", "N", "Z"],
  7 => ["F", "M", "S", "P", "V", "G", "C", "N"],
  8 => ["W", "Q", "R", "J", "F", "V", "C", "Z"],
  9 => ["R", "P", "M", "L", "H"]
}

# create Agent for state
{:ok, pid} = Agent.start_link(fn -> %{} end)
Process.register(pid, :kv)

Enum.each(crates, fn {key, value} ->
  Agent.update(:kv, fn map -> Map.put(map, key, value) end)
end)

commands =
  Enum.map(input, fn command ->
    String.split(command)
  end)

for command <- commands do
  move = String.to_integer(Enum.at(command, 1))
  from = String.to_integer(Enum.at(command, 3))
  to = String.to_integer(Enum.at(command, 5))

  IO.puts("move: #{move} from: #{from} to: #{to}")

  take = Agent.get(:kv, fn crates -> Map.get(crates, from) |> Enum.take(-move) end)
  IO.puts("take: #{move} #{take}")
  org = Agent.get(:kv, fn crates -> Map.get(crates, from) end)
  IO.puts("org: #{from} #{org}")
  target = Agent.get(:kv, fn crates -> Map.get(crates, to) end)
  IO.puts("target: #{to} #{target}")

  Agent.update(:kv, fn crates ->
    Map.put(crates, from, Map.get(crates, from) |> Enum.drop(-move))
  end)

  # Part 1
  # Agent.update(:kv, fn crates ->
  #   Map.put(crates, to, Map.get(crates, to) ++ Enum.reverse(take))
  # end)
  # Part 2
  Agent.update(:kv, fn crates ->
    Map.put(crates, to, Map.get(crates, to) ++ take)
  end)

  org = Agent.get(:kv, fn crates -> Map.get(crates, from) end)
  target = Agent.get(:kv, fn crates -> Map.get(crates, to) end)
  IO.puts("result: #{org} #{target}")
end

crates = Agent.get(:kv, fn crates -> crates end)

IO.inspect(crates)

# get last item from map list
result =
  Enum.map(crates, fn {_key, value} ->
    Enum.at(value, -1)
  end)
  |> Enum.join("")

IO.inspect(result)
