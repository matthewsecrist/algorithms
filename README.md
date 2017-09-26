# Algorithms

## Common algorithms in Elixir.

### Binary Search
  Binary Search in Elixir is interesting. If you use a list, its a Linked List with requires an O(N) lookup to get the length and get the middle element. It actually ends up being slower than the tail recursive linear search. So, `Algorithms.Binary` includes `search/2` and `list_search/2` to work with.

  `search/2` - Takes a list, converts it to a tuple and then performs a binary search. Finding an element and getting the length are both O(1), so this is much faster. Unfortunately, converting the list seems to fail when dealing with lists of around 16 million elements.

  ```elixir
    iex> Algorithms.Binary.search(234, Enum.into(1..1000, []))
    {:ok, 233}
    iex> Algorithms.Binary.search(123, Enum.into(1..10_000_000, []))
    {:ok, 122}
    iex> Algorithms.Binary.search(123, Enum.into(1..100_000_000, []))
    ** (ArgumentError) argument error
    :erlang.list_to_tuple([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, ...])
  ```

  `list_search/2` - Takes a list, and performs a binary search on it. Much slower than the binary search and the linear search.

  ```elixir
    iex> Algorithms.Binary.list_search(234, Enum.into(1..1000, []))
    {:ok, 233}
    iex> Algorithms.Binary.list_search(123, Enum.into(1..10_000_000, []))
    {:ok, 122}
    iex> Algorithms.Binary.list_search(135124, Enum.into(1..100_000_000, []))
    {:ok, 135123}
  ```

### Linear Search
  Tail recursive linear search. Surprisingly fast. Takes in the list, checks to see if the head of the list is equal to the number that we're looking for, and if its not then it throws away the head, increments the iteration counter and then passes the tail of the list to the recursive function.

  ```elixir
    iex> Algorithms.Linear.search(123456, list)
    {:ok, 123455}
  ```
