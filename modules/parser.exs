defmodule Parse do
  def parse(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(&String.split(&1, "\n"))
  end
end
