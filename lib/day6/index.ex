input = File.read!("./lib/day6/input")

input = Parse.parse(input)

datastream = Enum.flat_map(input, fn string -> String.to_charlist(string) end)

chunks = Enum.chunk_every(datastream, 4, 1, :discard)

result =
  Enum.map(chunks, fn chunk ->
    Enum.uniq(chunk)
  end)
  |> Enum.find_index(fn chunk ->
    Enum.count(chunk) == 4
  end)

IO.inspect(result + 4)

# Part 2
chunks = Enum.chunk_every(datastream, 14, 1, :discard)

result =
  Enum.map(chunks, fn chunk ->
    Enum.uniq(chunk)
  end)
  |> Enum.find_index(fn chunk ->
    Enum.count(chunk) == 14
  end)

IO.inspect(result + 14)
