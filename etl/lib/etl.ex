defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    Enum.reduce(input, %{}, fn {score, letters}, acc ->
      Map.merge(acc, map_for_score(score, letters))
    end)
  end

  defp map_for_score(score, letters) do
    Enum.reduce(letters, %{}, fn letter, acc ->
     Map.put(acc, String.downcase(letter), score)
    end)
  end
end
