defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @letters MapSet.new(?a..?z)

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence), do: missing_letters(sentence) |> Enum.empty?()

  defp missing_letters(sentence), do: MapSet.difference(@letters, code_points(sentence))

  defp code_points(sentence), do: String.downcase(sentence) |> String.to_charlist() |> MapSet.new()
end
