defmodule Algorithms.Linear do
  @moduledoc """
  Linear Search Algorithm
  """

  @doc """
  Main search function

  Tail recursive linear search. Surprisingly fast. Takes in the list,
  checks to see if the head of the list is equal to the number that
  we're looking for, and if its not then it throws away the head,
  increments the iteration counter and then passes the tail of the
  list to the recursive function.

  ## Examples
      iex> Algorithms.Linear.search(51, Enum.into(1..100, []))
      {:ok, 50}
  """
  def search(item, [item]), do: {:ok, 0}
  def search(_, []), do: {:error, :bad_list}
  def search(item, list) do
    ls(item, hd(list), tl(list), 0)
  end

  # Gets called by search as ls(item, head, list, iteration)
  # If the item does not match the head of the list,
  # Iteration increments by one, keeping track of where in the
  # list we are. If item matches the head, then it returns
  # the iteration.
  defp ls(_, _, [], _), do: {:error, :not_found}
  defp ls(item, head, list, iteration) do
    cond do
      item == head ->
        {:ok, iteration}
      item < head ->
        {:error, :not_found}
      true ->
        ls(item, hd(list), tl(list), iteration + 1)
    end
  end
end
