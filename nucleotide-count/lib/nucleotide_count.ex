defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count(~c"AATAA", ?A)
  4

  iex> NucleotideCount.count(~c"AATAA", ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    if Enum.member?(@nucleotides, nucleotide) do
      do_count(strand, nucleotide, 0)
    else
      raise("Invalid nucleotide")
    end
  end

  defp do_count([], _, count), do: count

  defp do_count([nucleotide | tail], nucleotide, count), do: do_count(tail, nucleotide, count + 1)

  defp do_count([_ | tail], nucleotide, count), do: do_count(tail, nucleotide, count)

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram(~c"AATAA")
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    Enum.reduce(
      strand,
      Map.new(@nucleotides, &{&1, 0}),
      fn (nucleotide, acc) -> Map.update(acc, nucleotide, 1, &(&1 + 1)) end
    )
  end
end
