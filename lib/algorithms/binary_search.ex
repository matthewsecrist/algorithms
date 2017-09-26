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
    {:error, :not_found}
    iex> Algorithms.Binary.search(1, [])
    {:error, :bad_list}
  """
  def search(item, list) when is_list(list) do
    search(item, list, 0, length(list))
  end

  # Throw an error when the list is empty.
  defp search(_, [], _, _), do: {:error, :bad_list}
  # If the list is only one value, we return that value.
  defp search(item, [item], _, _), do: {:ok, 0}
  # If the list is only one value and the value is not
  # the one we're looking for return :not_found.
  defp search(_item, [_not_item], _, _), do: {:error, :not_found}
  # Binary Search Algorithm
  defp search(item, list, startpos, endpos) do
    halfpoint = div(startpos + endpos, 2) # Find the halfpoint
    # Enum.fetch will either return {:ok, number} or :error
    # If it returns {:ok, number} we want to continue
    # Otherwise, it returned an error and we should return :not_found.
    with {:ok, half} <- Enum.fetch(list, halfpoint) do
      cond do
        item < half -> # If the item at the halfpoint is larger
          search(item, list, startpos, halfpoint - 1)
        item > half -> # If the item at the halfpoint is smaller
          search(item, list, halfpoint + 1, endpos)
        true -> # If the items are equal
          {:ok, halfpoint}
      end
    else
      # Return :not_found if the number is not found.
      _ -> {:error, :not_found}
    end
  end
end
