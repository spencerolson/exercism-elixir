defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    String.split(line, ~r/<[~*=-]*>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end\-of\-line\d+/i, "")
  end

  def tag_with_user_name(line) do
    Regex.run(~r/User\s+(\S*)/, line) |> tagged_line(line)
  end

  defp tagged_line([_, user], line), do: "[USER] #{user} #{line}"
  defp tagged_line(nil, line), do: line
end
