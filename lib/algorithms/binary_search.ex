defmodule Algorithms.Binary do
  @moduledoc """
  Binary search algorithm.
  """

  @doc """
  Main search function.

  ## Examples
    iex> Algorithms.Binary.search(32, Range.new(1, 100) |> Enum.to_list)
    31

  """
  def search(item, list) when is_list(list) do
    search(item, list, 0, length(list) - 1)
  end

  def search(item, list, startpos, endpos) when startpos < endpos do
    halfpoint = div(startpos + endpos, 2)
    half = Enum.at(list, halfpoint)
    cond do
      item == Enum.at(list, startpos) ->
        startpos
      item == Enum.at(list, endpos) ->
        endpos
      item == half ->
        halfpoint
      item < half ->
        search(item, list, startpos, halfpoint - 1)
      item > half ->
        search(item, list, halfpoint + 1, endpos)
    end
  end

  def search(_item, _list, startpos, endpos) when startpos >= endpos, do: nil
end
