defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

@spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
def convert(digits, input_base, output_base) do
    with {:ok} <- validate_base("input", input_base),
         {:ok} <- validate_base("output", output_base),
         {:ok} <- validate_digits(digits, input_base)
    do
      do_convert(digits, input_base, output_base)
    else
      {:error, err} -> {:error, err}
    end
  end

  defp do_convert([], _, _) do
    {:ok, [0]}
  end

  defp do_convert(digits, input_base, output_base) do
    result = base_ten(digits, input_base) |> to_base(output_base, [])
    {:ok, result}
  end

  defp validate_base(name, base) when base < 2 do
    {:error, "#{name} base must be >= 2"}
  end

  defp validate_base(_, _), do: {:ok}
  defp validate_digits(digits, base) do
    if Enum.all?(digits, fn digit -> digit >= 0 and digit < base end) do
      {:ok}
    else
      {:error, "all digits must be >= 0 and < input base"}
    end
  end

  defp base_ten(digits, input_base) do
    digits
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce(0, fn {digit, index}, acc ->
      acc + digit * (input_base ** index)
    end)
  end

  defp to_base(0, _, []), do: [0]
  defp to_base(0, _, acc), do: acc
  defp to_base(number, base, acc) do
    new_acc = [rem(number, base) | acc]
    new_number = div(number, base)
    to_base(new_number, base, new_acc)
  end
end
