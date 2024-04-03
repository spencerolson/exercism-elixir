defmodule Prime do
  @doc """
  Generates the nth prime.
  """

  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(n) when n > 0, do: find_prime(n, 1, 2)

  defp find_prime(count, count, number), do: number
  defp find_prime(desired_count, count, number) do
    number = number + 1
    count = if prime?(number), do: count + 1, else: count
    find_prime(desired_count, count, number)
  end

  defp prime?(3), do: true
  defp prime?(number), do: !Enum.any?(2..div(number, 2), &divisible_by?(number, &1))

  defp divisible_by?(number, divisor), do: rem(number, divisor) == 0
end
