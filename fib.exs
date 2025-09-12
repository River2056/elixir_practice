defmodule Fib do
  def fib(n) do
    {value, _} = do_fib(n)
    value
  end

  defp do_fib(n, memo \\ %{})

  defp do_fib(n, memo) when n <= 1, do: {n, memo}

  defp do_fib(n, memo) do
    case Map.fetch(memo, n) do
      {:ok, value} ->
        {value, memo}

      :error ->
        {val1, memo1} = do_fib(n - 1, memo)
        {val2, memo2} = do_fib(n - 2, memo1)

        val = val1 + val2
        {val, Map.put(memo2, n, val)}
    end
  end
end

IO.inspect(Fib.fib(5000))
