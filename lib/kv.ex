defmodule KV do
  @moduledoc """
  Documentation for `KV`.
  """

  @doc """
  Infinite loop with State

  ## Examples


      iex> {:ok, pid} = KV.start_link()
      iex> Process.register(pid, :kv)
      iex> send(:kv, {:put, key, value})
      iex> send(:kv, {:get, key, self()})

  """

  # STATE

  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)

      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end
