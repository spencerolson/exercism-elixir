defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    location({x, y}) |> location_score()
  end

  defp location(coords) do
    coords |> distance_to_bullseye() |> target_location()
  end

  defp distance_to_bullseye({x, y}), do: :math.sqrt(x ** 2 + y ** 2)

  defp target_location(distance) when distance >= 0 and distance <= 1, do: :inner
  defp target_location(distance) when distance > 1 and distance <= 5, do: :middle
  defp target_location(distance) when distance > 5 and distance <= 10, do: :outer
  defp target_location(distance) when distance > 10, do: :outside

  defp location_score(:outside), do: 0
  defp location_score(:outer), do: 1
  defp location_score(:middle), do: 5
  defp location_score(:inner), do: 10
end
