defmodule Acronym do
  @moduledoc false

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """

  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split([" ", "-", "_"], trim: true)
    |> Enum.map(&String.first/1)
    |> Enum.map(&String.upcase/1)
    |> List.to_string()
  end
end
