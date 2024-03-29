defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates), do: Enum.filter(candidates, &anagram?(&1, base))

  defp anagram?(candidate, base), do: different_words?(candidate, base) && same_letters?(candidate, base)

  defp different_words?(candidate, base), do: String.upcase(candidate) != String.upcase(base)

  defp same_letters?(candidate, base), do: sorted_graphemes(candidate) == sorted_graphemes(base)

  defp sorted_graphemes(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
