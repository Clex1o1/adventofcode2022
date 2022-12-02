input = File.read!('input')

defmodule Parse do
  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
  end
end

guide = Parse.parse(input)


IO.inspect(guide)
