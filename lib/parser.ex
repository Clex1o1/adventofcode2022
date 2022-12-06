defmodule Parse do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
  end
end
