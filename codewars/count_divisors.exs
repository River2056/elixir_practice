defmodule Kata do
  def divisors(n) do
    find_divisors(n)
  end

  defp find_divisors(n, divide \\ 1, count \\ 0) when divide < n do
    remain = rem(n, divide)

    if remain === 0 do
      find_divisors(n, divide + 1, count + 1)
    else
      find_divisors(n, divide + 1, count)
    end
  end

  defp find_divisors(n, divide, count) when divide === n, do: count + 1
end

Enum.each([{1, 1}, {10, 4}, {11, 2}, {25, 3}, {54, 8}], fn {n, expected} ->
  res = Kata.divisors(n)
  IO.puts(res)

  if res !== expected do
    IO.puts("expected #{expected}, got #{res}")
  end
end)
