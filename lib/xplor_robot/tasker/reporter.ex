defmodule XplorRobot.Tasker.Reporter do
  @doc """
  iex> Reporter.final_numbers([
  iex>   {:final, 7, [
  iex>     {3, [{1, 1, :sleep_check}, {2, 2, :nappy_change}]},
  iex>     {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
  iex>   ]},
  iex>   {:final, 8, [
  iex>     {4, [{2, 2, :nappy_change}, {1, 1, :sleep_check}]},
  iex>     {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
  iex>   ]}
  iex> ])
  [7, 8]
  """
  def final_numbers(crunches) do
    Enum.map(crunches, fn {:final, n, _} -> n end)
  end

  @doc """
  iex> Reporter.shortest_path([
  iex>   {:final, 7, []},
  iex>   {:final, 8, []},
  iex>   {:final, 3, []},
  iex>   {:final, 9, []},
  iex> ])
  {:final, 3, []}
  """
  def shortest_path(crunches) do
    Enum.min_by(crunches, fn {:final, n, _} -> n end)
  end
end
