defmodule BinarySearchTest do
  use ExUnit.Case
  doctest Algorithms.Binary

  alias Algorithms.Binary

  test "Finds 3 in a range of 0..10" do
    list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert Binary.search(3, list) == {:ok, 3}
  end

  test "Finds 68 in a range of 0..100" do
    list = Enum.into(0..100, [])
    assert Binary.search(68, list) == {:ok, 68}
  end

  test "Finds 512 in a range of 0..1000" do
    list = Enum.into(0..1000, [])
    assert Binary.search(512, list) == {:ok, 512}
  end

  test "Finds 2521 in a range of 1000..5000" do
    list = Enum.into(1000..5000, [])
    assert Binary.search(2521, list) == {:ok, 1521}
  end

  test "Does not find 11 in a range of 1..10" do
    list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert Binary.search(11, list) == {:error, :not_found}
  end

  test "Does not find 999 in a range of 1..100" do
    list = Enum.into(1..100, [])
    assert Binary.search(999, list) == {:error, :not_found}
  end

  test "Finds 1 in an range of [1]" do
    assert Binary.search(1, [1]) == {:ok, 0}
  end

  test "Does not find 5 in a range of [1]" do
    assert Binary.search(5, [1]) == {:error, :not_found}
  end

  test "Does not search an empty list" do
    assert Binary.search(0, []) == {:error, :bad_list}
  end

  test "List: Finds 3 in a range of 0..10" do
    list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert Binary.list_search(3, list) == {:ok, 3}
  end

  test "List: Finds 68 in a range of 0..100" do
    list = Enum.into(0..100, [])
    assert Binary.list_search(68, list) == {:ok, 68}
  end

  test "List: Finds 512 in a range of 0..1000" do
    list = Enum.into(0..1000, [])
    assert Binary.list_search(512, list) == {:ok, 512}
  end

  test "List: Finds 2521 in a range of 1000..5000" do
    list = Enum.into(1000..5000, [])
    assert Binary.list_search(2521, list) == {:ok, 1521}
  end

  test "List: Does not find 11 in a range of 1..10" do
    list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert Binary.list_search(11, list) == {:error, :not_found}
  end

  test "List: Does not find 999 in a range of 1..100" do
    list = Enum.into(1..100, [])
    assert Binary.list_search(999, list) == {:error, :not_found}
  end

  test "List: Finds 1 in an range of [1]" do
    assert Binary.list_search(1, [1]) == {:ok, 0}
  end

  test "List: Does not find 5 in a range of [1]" do
    assert Binary.list_search(5, [1]) == {:error, :not_found}
  end

  test "List: Does not search an empty list" do
    assert Binary.list_search(0, []) == {:error, :bad_list}
  end
end
