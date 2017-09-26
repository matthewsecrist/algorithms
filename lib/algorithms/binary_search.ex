defmodule Algorithms.Binary do
  @moduledoc """
  Binary search algorithm.
  """

  @doc """
  Main search function.

  ## Examples
    iex> Algorithms.Binary.search(32, Range.new(1, 100) |> Enum.to_list)
    {:ok, 31}
    iex> Algorithms.Binary.search(123, Range.new(1, 100) |> Enum.to_list)
    {:ok, :not_found}
    iex> Algorithms.Binary.search(1, [])
    {:error, :bad_list}
  """
  def search(item, list) when is_list(list) do
    search(item, list, 0, length(list))
  end

  def search(_, [], _, _), do: {:error, :bad_list}
  def search(_, [_], _, _), do: {:ok, 0}
  def search(item, list, startpos, endpos) do
    halfpoint = div(startpos + endpos, 2)
    with {:ok, half} <- Enum.fetch(list, halfpoint) do
      cond do
        item < half ->
          search(item, list, startpos, halfpoint - 1)
        item > half ->
          search(item, list, halfpoint + 1, endpos)
        true ->
          {:ok, halfpoint}
      end
    else
      _ -> {:ok, :not_found}
    end
  end
end
