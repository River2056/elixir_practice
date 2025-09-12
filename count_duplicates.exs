defmodule DuplicateCount do
  def count(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.filter(fn x -> x > 1 end)
    |> Enum.count()
  end
end

Enum.each(
  [
    {"", 0},
    {"abcde", 0},
    {"aabbcde", 2},
    {"aabBcde", 2},
    {"Indivisibility", 1},
    {"Indivisibilities", 2}
  ],
  fn {str, expected} ->
    res = DuplicateCount.count(str)

    if res !== expected do
      IO.inspect("expected: ")
      IO.inspect(expected)
      IO.inspect("got: ")
      IO.inspect(res)
    end
  end
)
