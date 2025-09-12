defmodule Bus do
  def number(stops) do
    Enum.reduce(stops, 0, fn {boarding, leaving}, acc ->
      acc + boarding - leaving
    end)
  end
end

Enum.each(
  [
    {[{10, 0}, {3, 5}, {5, 8}], 5},
    {[{3, 0}, {9, 1}, {4, 10}, {12, 2}, {6, 1}, {7, 10}], 17},
    {[{3, 0}, {9, 1}, {4, 8}, {12, 2}, {6, 1}, {7, 8}], 21}
  ],
  fn {t, expected} ->
    res = Bus.number(t)
    IO.inspect(res)

    if res !== expected do
      IO.puts("expected #{expected}, got #{res}")
    end
  end
)
