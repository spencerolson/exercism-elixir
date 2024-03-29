defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    armstrong_number(number) == number
  end

  defp armstrong_number(number) do
    digits = Integer.digits(number) |> length()

    number
    |> Integer.digits()
    |> Enum.reduce(0, &(&2 + &1 ** digits))
  end
end
