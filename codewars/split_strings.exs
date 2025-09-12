defmodule SplitStrings do
  def solution(str) do
    padded_str =
      if rem(String.length(str), 2) !== 0 do
        str <> "_"
      else
        str
      end

    padded_str |> String.graphemes() |> group()
  end

  defp group(elements, result \\ [])

  defp group([], acc), do: acc

  defp group([a, b | rest], acc) do
    group(rest, acc ++ [a <> b])
  end
end

Enum.each(
  [{"abcdef", ["ab", "cd", "ef"]}, {"abcdefg", ["ab", "cd", "ef", "g_"]}, {"", []}],
  fn {input, expected} ->
    res = SplitStrings.solution(input)
    IO.inspect(res)

    if res != expected do
      IO.puts("expected: ")
      IO.inspect(expected)
      IO.puts("got: ")
      IO.inspect(res)
    end
  end
)
