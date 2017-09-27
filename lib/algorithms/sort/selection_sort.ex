defmodule Algorithms.Selection do
  @moduledoc """
  Selection Sort Algoritm.
  """

  @doc """
  Main bubble sort function.

  Pretty much the opposite of Bubble Sort. It finds the minimum of the list,
  compares it to the rest of the list, then recursively calls `select/1` with
  the lowest number removed from the original list and placed into the new list.

  ## Examples
    iex> Algorithms.Selection.sort([5,4,3,2,1])
    {:ok, [1, 2, 3, 4, 5]}
    iex> Algorithms.Selection.sort([5,5,4,5,2,22,6,5,2,6,8,2436,4,2,4,62,4,6,2])
    {:ok, [2, 2, 2, 2, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 8, 22, 62, 2436]}
  """
  def sort(list) do
    select(list, [])
  end

  defp select([], []), do: {:error, :no_list}
  defp select([hd | []], list), do: {:ok, list ++ [hd]}
  defp select([hd | tl], list) do
    min = Enum.min([hd | tl])
    select([hd | tl] -- [min], list ++ [min])
  end
end
