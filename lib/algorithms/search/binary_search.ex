defmodule Algorithms.Binary do
  @moduledoc """
  Binary search algorithm.
  """

  @doc """
  Main search function takes either a list or a tuple, either way it converts it to
  a tuple for faster parsing.

  WARNING: Right now it errors around 16 million elements in the conversion from list
  to tuple.

  ## Examples
      iex> Algorithms.Binary.search(32, Enum.into(1..100, []))
      {:ok, 31}
      iex> Algorithms.Binary.search(123, Enum.into(1.. 100, []))
      {:error, :not_found}
      iex> Algorithms.Binary.search(1, [])
      {:error, :bad_list}
  """
  def search(item, list) when is_list(list) do
    tup = List.to_tuple(list)
    tuple_bs(item, tup, 0, tuple_size(tup))
  end

  def search(item, tuple) when is_tuple(tuple) do
    tuple_bs(item, tuple, 0, tuple_size(tuple))
  end


  @doc """
  Binary search for a linked list. Not recommended due to traversing the list
  with every iteration.

  ## Examples
      iex> Algorithms.Binary.list_search(32, Enum.into(1..100, []))
      {:ok, 31}
      iex> Algorithms.Binary.list_search(123, Enum.into(1..100, []))
      {:error, :not_found}
      iex> Algorithms.Binary.list_search(1, [])
      {:error, :bad_list}
  """
  def list_search(item, list) when is_list(list) do
    bs(item, list, 0, length(list))
  end

  # Throw an error when the list is empty.
  defp bs(_, [], _, _), do: {:error, :bad_list}
  # If the list is only one value, we return that value.
  defp bs(item, [item], _, _), do: {:ok, 0}
  # If the list is only one value and the value is not
  # the one we're looking for return :not_found.
  defp bs(_item, [_not_item], _, _), do: {:error, :not_found}
  # Binary Search Algorithm
  defp bs(item, list, startpos, endpos) do
    halfpoint = div(startpos + endpos, 2) # Find the halfpoint
    # Enum.fetch will either return {:ok, number} or :error
    # If it returns {:ok, number} we want to continue
    # Otherwise, it returned an error and we should return :not_found.
    with {:ok, half} <- Enum.fetch(list, halfpoint) do
      cond do
        item < half -> # If the item at the halfpoint is larger
          bs(item, list, startpos, halfpoint - 1)
        item > half -> # If the item at the halfpoint is smaller
          bs(item, list, halfpoint + 1, endpos)
        true -> # If the items are equal
          {:ok, halfpoint}
      end
    else
      # Return :not_found if the number is not found.
      _ -> {:error, :not_found}
    end
  end

  defp tuple_bs(_, {}, _, _), do: {:error, :bad_list}
  defp tuple_bs(item, tuple, startpos, endpos) do
    halfpoint = div(startpos + endpos, 2)
    with {:ok, half} <- get_middle_element(tuple, halfpoint) do
      cond do
        item < half ->
          tuple_bs(item, tuple, startpos, halfpoint - 1)
        item > half ->
          tuple_bs(item, tuple, halfpoint + 1, endpos)
        true ->
          {:ok, halfpoint}
      end
    else
      _ ->
        {:error, :not_found}
    end

  end

  defp get_middle_element(tuple, _) when tuple_size(tuple) == 0, do: {:error, :bad_list}
  defp get_middle_element(tuple, key) do
    try do
      {:ok, elem(tuple, key)}
    rescue
      _ -> {:error, :not_found}
    end
  end
end
