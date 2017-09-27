defmodule Algorithms.Bubble do
  @moduledoc """
  Bubble Sort Algorithm
  """
  @doc """
  Main bubble sort function.

  Takes the head of the list, compares it to the rest
  of the list to find the maximum value in the list. Then it calls `bubble/2` again
  with the maximum value removed from the inital list and added to the new list.

  ## Examples
    iex> Algorithms.Bubble.sort([5,4,3,2,1])
    {:ok, [1, 2, 3, 4, 5]}
    iex> Algorithms.Bubble.sort([5,5,4,5,2,22,6,5,2,6,8,2436,4,2,4,62,4,6,2])
    {:ok, [2, 2, 2, 2, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 8, 22, 62, 2436]}
  """
  def sort(list) do
    bubble(list, [])
  end

  # Find the highest value and move it to the end of the list
  # and then repeat with that number taken out until we get to
  # an empty tail.
  defp bubble([], []), do: {:error, :no_list}
  defp bubble([hd | []], list), do: {:ok, [hd] ++ list}
  defp bubble([hd | tl], list) do
    max = Enum.max([hd | tl])
    bubble([hd | tl] -- [max], [max] ++ list)
  end

end
