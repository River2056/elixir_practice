defmodule Josephus do
  def survivor(n, k) when n > 1 do
    rem(survivor(n - 1, k) + k - 1, n) + 1
  end

  def survivor(1, _k), do: 1
end

Enum.each([{{7, 3}, 4}, {{11, 19}, 10}, {{1, 300}, 1}, {{14, 2}, 13}, {{100, 1}, 100}], fn {{n,
                                                                                             k},
                                                                                            expected} ->
  res = Josephus.survivor(n, k)
  IO.puts("res: #{res}")

  if res !== expected do
    IO.puts("expected: #{expected}, got: #{res}")
  end
end)
