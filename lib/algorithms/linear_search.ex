defmodule Algorithms.Linear do
  @moduledoc """
  Linear Search Algorithm
  """

  @doc """
  Main search function

  ## Examples
    iex> Algorithms.Linear.search(51, Range.new(1, 100) |> Enum.to_list)
    {:ok, 50}
  """
  def search(item, [item]), do: {:ok, 0}
  def search(_, []), do: {:error, :bad_list}
  def search(item, list) do
    ls(item, hd(list), tl(list), 0)
  end

  defp ls(_, _, [], _), do: {:error, :not_found}
  defp ls(item, head, list, iteration) do
    cond do
      item == head ->
        {:ok, iteration}
      true ->
        ls(item, hd(list), tl(list), iteration + 1)
    end
  end
end
