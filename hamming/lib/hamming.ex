defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2), do: {:error, "strands must be of equal length"}

  def hamming_distance(strand1, strand2) do
    Enum.zip(strand1, strand2)
    |> Enum.reduce(0, &count/2)
    |> then(&{:ok, &1})
  end

  defp count({a, a}, acc), do: acc
  defp count(_, acc), do: acc + 1
end
